import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AbstergoInfoPage extends StatelessWidget {
  const AbstergoInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Về Abstergo'),
        backgroundColor: Colors.redAccent,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
          },
          child: const Text('Abstergo'),
        ),
      ),
    );
  }
}