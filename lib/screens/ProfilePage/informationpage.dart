import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InformationPage extends StatelessWidget {
  const InformationPage({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Thông tin cá nhân"),
        actions: [
          IconButton(
            onPressed: () {
              // Hành động chỉnh sửa
            },
            icon: const Icon(Icons.edit, color: Colors.red),
            tooltip: "Chỉnh sửa",
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Ảnh đại diện và quyền
            Row(
              children: [
                // Ảnh đại diện
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    "https://via.placeholder.com/100",
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 16),
                // Thông tin quyền
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text("Quyền: Staff", style: TextStyle(fontWeight: FontWeight.bold)),
                    Text("Phòng ban: "),
                    Text("Chức vụ: "),
                  ],
                ),
              ],
            ),
            const Divider(thickness: 1, color: Colors.grey),
            const SizedBox(height: 16),
            Text("Họ và tên:"),
            const SizedBox(height: 8),
            // Họ và tên
            TextField(
              decoration: InputDecoration(

                border: OutlineInputBorder(),
                hintText: "Nhập họ và tên",
              ),
              controller: TextEditingController(text: "Test_role_staff AD"),
            ),
            const SizedBox(height: 16),
            Text("Số điện thoại:"),
            const SizedBox(height: 8),
            // Số điện thoại
            TextField(
              decoration: InputDecoration(

                border: OutlineInputBorder(),
                prefix: const Text("+84"),
              ),
              controller: TextEditingController(text: "987656700"),
              keyboardType: TextInputType.phone,
            ),
            const SizedBox(height: 16),
            Text("Email:"),
            const SizedBox(height: 8),
            // Email
            TextField(
              decoration: InputDecoration(

                border: OutlineInputBorder(),
              ),
              controller: TextEditingController(text: "hoaitu120403+1@gmail.com"),
              keyboardType: TextInputType.emailAddress,
            ),
            const SizedBox(height: 16),
            Text("Địa chỉ:"),
            const SizedBox(height: 8),
            // Địa chỉ
            TextField(
              decoration: InputDecoration(

                border: OutlineInputBorder(),
              ),
              controller: TextEditingController(text: "Khu A Kí túc xá khu B A A"),
            ),
            const SizedBox(height: 16),

            Text("Thành phố / Tỉnh:"),
            const SizedBox(height: 8),
            // Thành phố / Tỉnh
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Nhập thành phố hoặc tỉnh",
              ),
            ),
            const SizedBox(height: 16),
            Text("Quận / Huyện:"),
            const SizedBox(height: 8),
            // Thành phố / Tỉnh
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Nhập thành phố hoặc tỉnh",
              ),
            ),
            const SizedBox(height: 16),
            Text("Phường / Xã:"),
            const SizedBox(height: 8),
            // Thành phố / Tỉnh
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Nhập thành phố hoặc tỉnh",
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: ElevatedButton(
                onPressed: () {
                  // Logic đổi mật khẩu ở đây
                },
                child: Text('Đổi Mật Khẩu'),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50), // Nút rộng toàn bộ màn hình
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
