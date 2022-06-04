import 'package:flutter/material.dart';

class QRView extends StatefulWidget {
  const QRView({Key? key}) : super(key: key);

  @override
  State<QRView> createState() => _QRViewState();
}

class _QRViewState extends State<QRView> {
  late final TextEditingController _textController;
  late final FocusNode _textFocus;
  String qrText = '';
  int qrColorIndex = 0;
  int qrBackgroundColorIndex = 0;

  @override
  void initState() {
    _textController = TextEditingController(text: qrText);
    _textFocus = FocusNode();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
