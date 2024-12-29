import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ActivityHistoryPage extends StatelessWidget {
  const ActivityHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lịch sử hoạt động'),
        backgroundColor: Colors.redAccent,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
          },
          child: const Text('Lịch sử hoạt động'),
        ),
      ),
    );
  }
}