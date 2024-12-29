import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_taskscheduling_app/screens/ProfilePage/aboutuspage.dart';
import 'package:flutter_taskscheduling_app/screens/ProfilePage/informationpage.dart';
import 'package:flutter_taskscheduling_app/screens/ProfilePage/settingpage.dart';
import 'package:flutter_taskscheduling_app/screens/ProfilePage/activityhistorypage.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ListTile(
            leading: const Icon(Icons.person, color: Colors.redAccent),
            title: const Text('Thông tin cá nhân'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Get.to(() => const InformationPage());
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.history, color: Colors.redAccent),
            title: const Text('Lịch sử hoạt động'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Get.to(() => const ActivityHistoryPage());
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.settings, color: Colors.redAccent),
            title: const Text('Cài đặt'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Get.to(() => const SettingsPage());
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.info, color: Colors.redAccent),
            title: const Text('Thông tin về Abstergo'),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Get.to(() => const AbstergoInfoPage());
            },
          ),
          const Divider(),
          const Spacer(),
          Column(
            children: [
              const Text(
                'Phiên bản: 1.1.0',
                style: TextStyle(color: Colors.grey),
              ),
              const Text(
                'Powered by Abstergo',
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                ),
                onPressed: () {
                  // Xử lý đăng xuất
                  Get.defaultDialog(
                    title: 'Đăng xuất',
                    middleText: 'Bạn có chắc chắn muốn đăng xuất?',
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    radius: 0,
                    confirm: ElevatedButton(
                      onPressed: () {
                        // Thực hiện đăng xuất
                        Get.back(); // Đóng dialog
                      },
                      child: const Text('Có'),
                    ),
                    cancel: ElevatedButton(
                      onPressed: () {
                        Get.back(); // Đóng dialog
                      },
                      child: const Text('Không'),
                    ),
                  );
                },
                child: const Text('Đăng xuất'),
              ),
            ],
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
