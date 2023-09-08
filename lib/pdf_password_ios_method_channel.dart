import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'pdf_password_ios_platform_interface.dart';

/// An implementation of [PdfPasswordIosPlatform] that uses method channels.
class MethodChannelPdfPasswordIos extends PdfPasswordIosPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('pdf_password_ios');

  @override
  Future<bool> isPasswordProtected(Uint8List bytes) async {
    try {
      final bool result =
          await methodChannel.invokeMethod('pdf_password_ios', bytes);
      return result;
    } catch (error) {
      if (kDebugMode) {
        print(
          'Erro ao tentar verificar se o PDF é protegido: ${error.toString()}',
        );
      }
    }
    return false;
  }
}
