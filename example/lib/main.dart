import 'package:flutter/material.dart';
import 'package:pdf_password_ios/pdf_password_ios.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _pdfPasswordIosPlugin = PdfPasswordIos();

  String statusPdf = 'Verificando';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: ElevatedButton(
            child: Text("Abrir PDF: $statusPdf"),
            onPressed: () async {
              final temSenha =
                  await _pdfPasswordIosPlugin.verifyPassowrd("/Pdf");
              setState(() async {
                statusPdf = temSenha.toString();
              });
            },
          ),
        ),
      ),
    );
  }
}
