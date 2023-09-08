import 'pdf_password_ios_platform_interface.dart';

class PdfPasswordIos {
  Future<String?> getPlatformVersion() {
    return PdfPasswordIosPlatform.instance.getPlatformVersion();
  }

  Future<bool?> verifyPassowrd(String path) {
    return PdfPasswordIosPlatform.instance.verifyPassword(path);
  }
}
