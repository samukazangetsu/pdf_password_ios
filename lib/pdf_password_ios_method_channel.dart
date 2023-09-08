import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'pdf_password_ios_platform_interface.dart';

/// An implementation of [PdfPasswordIosPlatform] that uses method channels.
class MethodChannelPdfPasswordIos extends PdfPasswordIosPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('pdf_password_ios');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
