import 'dart:typed_data';

import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'pdf_password_ios_method_channel.dart';

abstract class PdfPasswordIosPlatform extends PlatformInterface {
  /// Constructs a PdfPasswordIosPlatform.
  PdfPasswordIosPlatform() : super(token: _token);

  static final Object _token = Object();

  static PdfPasswordIosPlatform _instance = MethodChannelPdfPasswordIos();

  /// The default instance of [PdfPasswordIosPlatform] to use.
  ///
  /// Defaults to [MethodChannelPdfPasswordIos].
  static PdfPasswordIosPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [PdfPasswordIosPlatform] when
  /// they register themselves.
  static set instance(PdfPasswordIosPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<bool> isPasswordProtected(Uint8List bytes);
}
