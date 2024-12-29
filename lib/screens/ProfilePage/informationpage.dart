import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InformationPage extends StatelessWidget {
  const InformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thông tin cá nhân'),
        backgroundColor: Colors.redAccent,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Get.snackbar(
              'Thông báo',
              'Đây là trang thông tin cá nhân',
              snackPosition: SnackPosition.BOTTOM,
            );
          },
          child: const Text('Hiển thị thông báo'),
        ),
      ),
    );
  }
}