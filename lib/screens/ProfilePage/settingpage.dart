import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cài đặt'),
        backgroundColor: Colors.redAccent,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
          },
          child: const Text('Cài đặt'),
        ),
      ),
    );
  }
}