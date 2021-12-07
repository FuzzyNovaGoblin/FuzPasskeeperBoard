use std::ffi::CStr;
use std::os::raw::c_char;

pub fn const_u8_to_string(data: *const c_char) -> String {
    let c_str_val = unsafe{CStr::from_ptr(data)};
    match c_str_val.to_str(){
        Ok(v) => v.to_owned(),
        Err(_) => "".into(),
    }
}
