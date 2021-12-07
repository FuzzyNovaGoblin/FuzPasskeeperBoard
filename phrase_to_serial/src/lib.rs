mod c_bridge;

use std::{
    ffi::CString,
    fs::{self, File},
    io::Write,
    os::raw::c_char,
    process::Command,
    thread,
    time::Duration,
};

use c_bridge::const_u8_to_string;

fn toggle_active() {
    let mut file = File::create("/sys/class/gpio/gpio6/value").unwrap();
    write!(&mut file, "1").unwrap();
    thread::sleep(Duration::from_millis(1));
    write!(&mut file, "0").unwrap();
    thread::sleep(Duration::from_millis(1));
}

fn send_char(mut c: u8) {
    for _ in 0..8 {
        {
            let mut file = File::create("/sys/class/gpio/gpio5/value").unwrap();
            if (c & 128) != 0 {
                write!(&mut file, "1").unwrap();
            } else {
                write!(&mut file, "0").unwrap();
            }
        }
        toggle_active();
        c <<= 1;
    }
}

#[no_mangle]
pub extern "C" fn string_to_serial(data: *const c_char) {
    let data = const_u8_to_string(data);
    for c in data.chars() {
        send_char(c as u8);
    }
}

pub fn get_session_key() -> String {
    let output = Command::new("/home/pi/bw_session.sh")
        .output()
        .expect("failed to run command");

    if output.status.success() {
        output
            .stdout
            .iter()
            .map(|v| *v as char)
            .collect::<String>()
            .split(" ")
            .last()
            .unwrap()
            .to_owned()
    } else {
        String::new()
    }
}
const BW_FILE_PATH: &str = "/home/pi/bwdata.json";

pub fn get_data_from_key(session_key: String) -> String {
    if session_key != "" {
        let output = Command::new("bw")
            .arg("list")
            .arg("items")
            .arg("--session")
            .arg(session_key)
            .output()
            .expect("failed to get bitwarden data");
        dbg!(&output);
        let mut file = File::create(BW_FILE_PATH).expect("failed to create file");
        file.write_all(&output.stdout).unwrap();
    }
    fs::read_to_string(BW_FILE_PATH).unwrap()
}

#[no_mangle]
pub extern "C" fn get_bw_data() -> *const c_char {
    CString::new(get_data_from_key(get_session_key()))
        .unwrap()
        .into_raw()
}
