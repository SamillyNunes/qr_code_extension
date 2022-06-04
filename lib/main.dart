import 'package:flutter/material.dart';
import 'package:qr_code_extension/views/qr_code/qr_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QR Code extension',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const QRView(),
    );
  }
}
