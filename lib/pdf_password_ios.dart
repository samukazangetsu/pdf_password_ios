import 'dart:typed_data';

import 'pdf_password_ios_platform_interface.dart';

class PdfPasswordIos {
  Future<bool?> isPasswordProtected(Uint8List bytes) {
    return PdfPasswordIosPlatform.instance.isPasswordProtected(bytes);
  }
}
