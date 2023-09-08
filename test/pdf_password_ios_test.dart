import 'package:flutter_test/flutter_test.dart';
import 'package:pdf_password_ios/pdf_password_ios.dart';
import 'package:pdf_password_ios/pdf_password_ios_platform_interface.dart';
import 'package:pdf_password_ios/pdf_password_ios_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockPdfPasswordIosPlatform
    with MockPlatformInterfaceMixin
    implements PdfPasswordIosPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final PdfPasswordIosPlatform initialPlatform = PdfPasswordIosPlatform.instance;

  test('$MethodChannelPdfPasswordIos is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelPdfPasswordIos>());
  });

  test('getPlatformVersion', () async {
    PdfPasswordIos pdfPasswordIosPlugin = PdfPasswordIos();
    MockPdfPasswordIosPlatform fakePlatform = MockPdfPasswordIosPlatform();
    PdfPasswordIosPlatform.instance = fakePlatform;

    expect(await pdfPasswordIosPlugin.getPlatformVersion(), '42');
  });
}
