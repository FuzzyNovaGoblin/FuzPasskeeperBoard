import 'dart:convert';
import 'dart:ffi';
import 'dart:io' show Platform, Directory;
// import 'package:web_crawler_flutter_ui/data/singleton.dart';
import 'package:fuz_passmng_ui/ffi/genphrase_to_serial.dart' as genphrase_to_serial;
import 'package:path/path.dart' as path;
import 'package:ffi/ffi.dart';
import 'dart:isolate';

late genphrase_to_serial.phrase_to_serial _phraseToSerialLib = _ffiSetup();

genphrase_to_serial.phrase_to_serial _ffiSetup() {
  // var libraryPath = path.join("/usr/lib/libphrase_to_serial.so");
  DynamicLibrary dylib = DynamicLibrary.open("/usr/lib/libphrase_to_serial.so");
  return genphrase_to_serial.phrase_to_serial(dylib);
}

List<dynamic> getBwData() => jsonDecode(_phraseToSerialLib.get_bw_data().cast<Utf8>().toDartString());

void sendAsKeyboard(String data) => _phraseToSerialLib.string_to_serial(data.toNativeUtf8().cast());
