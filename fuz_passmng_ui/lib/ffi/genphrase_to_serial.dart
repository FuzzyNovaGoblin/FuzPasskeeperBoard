// AUTO GENERATED FILE, DO NOT EDIT.
//
// Generated by `package:ffigen`.
import 'dart:ffi' as ffi;

class phrase_to_serial {
  /// Holds the symbol lookup function.
  final ffi.Pointer<T> Function<T extends ffi.NativeType>(String symbolName)
      _lookup;

  /// The symbols are looked up in [dynamicLibrary].
  phrase_to_serial(ffi.DynamicLibrary dynamicLibrary)
      : _lookup = dynamicLibrary.lookup;

  /// The symbols are looked up with [lookup].
  phrase_to_serial.fromLookup(
      ffi.Pointer<T> Function<T extends ffi.NativeType>(String symbolName)
          lookup)
      : _lookup = lookup;

  void string_to_serial(
    ffi.Pointer<ffi.Int8> data,
  ) {
    return _string_to_serial(
      data,
    );
  }

  late final _string_to_serialPtr =
      _lookup<ffi.NativeFunction<ffi.Void Function(ffi.Pointer<ffi.Int8>)>>(
          'string_to_serial');
  late final _string_to_serial =
      _string_to_serialPtr.asFunction<void Function(ffi.Pointer<ffi.Int8>)>();

  ffi.Pointer<ffi.Int8> get_bw_data() {
    return _get_bw_data();
  }

  late final _get_bw_dataPtr =
      _lookup<ffi.NativeFunction<ffi.Pointer<ffi.Int8> Function()>>(
          'get_bw_data');
  late final _get_bw_data =
      _get_bw_dataPtr.asFunction<ffi.Pointer<ffi.Int8> Function()>();
}
