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
      body: ListView(
        children: [
          // Mục Phiên bản
          ListTile(
            title: Text('Phiên bản'),
            subtitle: Text('1.2.8'),
            onTap: () {

            },
          ),
          const Divider(thickness: 0.2, color: Colors.grey),
          // Mục Hướng dẫn sử dụng
          ListTile(
            title: Text('Hướng dẫn sử dụng'),
            trailing: Icon(Icons.open_in_new_outlined),
            onTap: () {

            },
          ),
          const Divider(thickness: 0.2, color: Colors.grey),
          // Mục Đánh giá ứng dụng
          ListTile(
            title: Text('Đánh giá ứng dụng'),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {

            },
          ),
        ],
      ),
    );
  }
}
