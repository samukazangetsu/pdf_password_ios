import 'dart:io';

import 'package:flutter/material.dart';
import 'package:pdf_password_ios/pdf_password_ios.dart';
import 'package:file_picker/file_picker.dart';

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
              final paths = await FilePicker.platform.pickFiles();
              if (paths?.files.single.path != null) {
                final file = File(paths!.files.single.path!);
                final bytes = file.readAsBytesSync();
                final temSenha =
                    await _pdfPasswordIosPlugin.isPasswordProtected(bytes);
                setState(() {
                  statusPdf = temSenha.toString();
                });
              }
            },
          ),
        ),
      ),
    );
  }
}
