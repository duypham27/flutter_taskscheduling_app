import 'package:flutter/material.dart';

class QRCodePage extends StatelessWidget {
  const QRCodePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'QR Code Page',
        style: TextStyle(fontSize: 24, color: Colors.redAccent),
      ),
    );
  }
}