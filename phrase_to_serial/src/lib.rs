use std::{fs::File, io::Write, thread, time::Duration};

fn toggle_active() {
    let mut file = File::create("/sys/class/gpio/gpio6/value").unwrap();
    write!(&mut file, "1").unwrap();
    thread::sleep(Duration::from_millis(1));
    write!(&mut file, "0").unwrap();
    thread::sleep(Duration::from_millis(1));
}

fn send_char(mut c: u8)
{
    let mut file = File::create("/sys/class/gpio/gpio5/value").unwrap();

   for _ in 0..8
   {
      if (c & 128) != 0
      {
          write!(&mut file, "1").unwrap();
      }
      else
      {
          write!(&mut file, "1").unwrap();
      }
      toggle_active();
      c <<= 1;
   }
}

pub fn string_to_serial(data: String){
    for c in data.chars(){
        send_char(c as u8);
    }
}