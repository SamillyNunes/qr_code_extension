import 'package:flutter/material.dart';
import 'package:qr_code_extension/constants.dart';
import 'package:qr_flutter/qr_flutter.dart';

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

  final InputBorder _inputBorder = OutlineInputBorder(
    borderSide: const BorderSide(
      color: Colors.black,
      width: 2,
    ),
    borderRadius: BorderRadius.circular(16),
  );

  @override
  void initState() {
    _textController = TextEditingController(text: qrText);
    _textFocus = FocusNode();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 24,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: QrImage(
                data: qrText,
                padding: const EdgeInsets.all(16),
                backgroundColor: qrBackgroundColors[qrBackgroundColorIndex],
                foregroundColor: qrColors[qrColorIndex],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 16,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextField(
                      controller: _textController,
                      focusNode: _textFocus,
                      decoration: InputDecoration(
                        labelText: 'QR Text',
                        labelStyle: const TextStyle(color: Color(0xFF80919F)),
                        hintText: 'Enter text / URL',
                        hintStyle: const TextStyle(color: Color(0xFF80919F)),
                        enabledBorder: _inputBorder,
                        focusedBorder: _inputBorder,
                      ),
                      onChanged: (value) => setState(() {
                        qrText = value;
                      }),
                    ),
                    const SizedBox(height: 24),
                    const Text(
                      'Choose QR Color',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                    Expanded(
                      child: ListView.separated(
                        separatorBuilder: (_, __) => const SizedBox(width: 8),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: qrColors.length,
                        itemBuilder: (context, index) => InkWell(
                          hoverColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () => setState(() {
                            qrColorIndex = index;
                          }),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              CircleAvatar(
                                radius: qrColorIndex == index ? 23 : 22,
                                backgroundColor: qrColorIndex == index
                                    ? Colors.black
                                    : Colors.black26,
                              ),
                              CircleAvatar(
                                radius: 20,
                                backgroundColor: qrColors[index],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    const Text(
                      'Choose QR Background Color',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                    Expanded(
                      child: ListView.separated(
                        separatorBuilder: (_, __) => const SizedBox(width: 8),
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        itemCount: qrBackgroundColors.length,
                        itemBuilder: (context, index) => InkWell(
                          hoverColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          highlightColor: Colors.transparent,
                          onTap: () => setState(() {
                            qrBackgroundColorIndex = index;
                          }),
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              CircleAvatar(
                                radius:
                                    qrBackgroundColorIndex == index ? 23 : 22,
                                backgroundColor: qrBackgroundColorIndex == index
                                    ? Colors.black
                                    : Colors.black26,
                              ),
                              CircleAvatar(
                                radius: 20,
                                backgroundColor: qrBackgroundColors[index],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
