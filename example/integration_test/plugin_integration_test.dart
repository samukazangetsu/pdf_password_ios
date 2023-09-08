// This is a basic Flutter integration test.
//
// Since integration tests run in a full Flutter application, they can interact
// with the host side of a plugin implementation, unlike Dart unit tests.
//
// For more information about Flutter integration tests, please see
// https://docs.flutter.dev/cookbook/testing/integration/introduction

import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:pdf_password_ios/pdf_password_ios.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets('getPlatformVersion test', (WidgetTester tester) async {
    final PdfPasswordIos plugin = PdfPasswordIos();
    final bool? temSenha =
        await plugin.isPasswordProtected(File('').readAsBytesSync());
    // The version string depends on the host platform running the test, so
    // just assert that some non-empty string is returned.
    expect(temSenha, false);
  });
}
