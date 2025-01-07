import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_taskscheduling_app/screens/ProfilePage/aboutuspage.dart';
import 'package:flutter_taskscheduling_app/screens/ProfilePage/informationpage.dart';
import 'package:flutter_taskscheduling_app/screens/ProfilePage/settingpage.dart';
import 'package:flutter_taskscheduling_app/screens/ProfilePage/activityhistorypage.dart';

class ProfileController extends GetxController {

}

class ProfilePage extends StatelessWidget {
  ProfilePage({super.key});

  final ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          _buildMenuItem(
            icon: Icons.person,
            text: 'Thông tin cá nhân',
            onTap: () => Get.to(() => const InformationPage()),
          ),
          _buildDivider(),
          _buildMenuItem(
            icon: Icons.history,
            text: 'Lịch sử hoạt động',
            onTap: () => Get.to(() => ActivityHistoryPage()),
          ),
          _buildDivider(),
          _buildMenuItem(
            icon: Icons.settings,
            text: 'Cài đặt',
            onTap: () => Get.to(() => SettingsPage()),
          ),
          _buildDivider(),
          _buildMenuItem(
            icon: Icons.info,
            text: 'Thông tin về Abstergo',
            onTap: () => Get.to(() => const AbstergoInfoPage()),
          ),
          const Spacer(),
          _buildFooter(),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildMenuItem({
    required IconData icon,
    required String text,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.redAccent),
      title: Text(text),
      trailing: const Icon(Icons.arrow_forward_ios),
      onTap: onTap,
    );
  }

  Widget _buildDivider() => const Divider();

  Widget _buildFooter() {
    return Column(
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
          onPressed: _showLogoutDialog,
          child: const Text('Đăng xuất'),
        ),
      ],
    );
  }

  void _showLogoutDialog() {
    Get.defaultDialog(
      title: 'Đăng xuất',
      middleText: 'Bạn có chắc chắn muốn đăng xuất?',
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      radius: 0,
      confirm: ElevatedButton(
        onPressed: () {
          // Xử lý đăng xuất
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
  }
}
