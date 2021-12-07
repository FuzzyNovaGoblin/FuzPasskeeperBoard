use phrase_to_serial::get_bw_data;
use phrase_to_serial::get_session_key;
fn main() {
    // string_to_serial("hello world".into());
    println!("{}", get_bw_data(get_session_key()));
}
