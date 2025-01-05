import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SettingsPage extends StatelessWidget {
  SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cài đặt'),
        backgroundColor: Colors.redAccent,
      ),
      body: ListView(
        children: [
          // Phần tiêu đề Cài đặt chung
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Cài đặt chung',
              style: TextStyle(
                color: Colors.redAccent, // Đặt màu cho văn bản
              ),
            ),
          ),

          // Mục Ngôn ngữ
          ListTile(
            leading: Icon(Icons.language),
            title: Text('Ngôn ngữ'),
            trailing: Text('Tiếng Việt'), // Đặt subtitle ở bên phải
            onTap: () {
              // Logic thay đổi ngôn ngữ nếu cần
            },
          ),

          // Mục Thông báo hệ thống
          ListTile(
            leading: Icon(Icons.notifications),
            title: Text('Thông báo hệ thống'),
            trailing: Text('Đang bật'), // Đặt subtitle ở bên phải
            onTap: () {
              // Logic thay đổi thông báo nếu cần
            },
          ),

          // Phần tiêu đề Khác
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Khác',
              style: TextStyle(
                color: Colors.redAccent, // Đặt màu cho văn bản
              ),
              // style: Theme.of(context).textTheme.headline6,
            ),
          ),

          // Mục Xoá tài khoản
          ListTile(
            leading: Icon(Icons.person_off_outlined),
            title: Text('Xoá tài khoản'),
            onTap: () {
              // Logic xoá tài khoản nếu cần
            },
          ),

          // Mục Xoá dữ liệu cục bộ
          ListTile(
            leading: Icon(Icons.storage_outlined),
            title: Text('Xoá dữ liệu cục bộ'),
            onTap: () {
              // Logic xoá dữ liệu nếu cần
            },
          ),
        ],
      ),
    );
  }
}
