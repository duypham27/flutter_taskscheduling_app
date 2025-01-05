import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ActivityItem {
  final String message;
  final String date;
  final Color backgroundColor;

  ActivityItem({required this.message, required this.date, required this.backgroundColor});
}

class ActivityHistoryPage extends StatelessWidget {
  ActivityHistoryPage({super.key});

  final List<ActivityItem> _activityItems = [
    ActivityItem(
      message: "Test_role_staff AD cập nhật mối nguy Mối nguy 1 với mã #1734329387",
      date: "16/12/2024 - 13:11",
      backgroundColor: Colors.white,
    ),
    ActivityItem(
      message: "Test_role_staff AD được gán xử lý mối nguy Mối nguy 1 với mã 1734329387 bởi Test_role_staff AD",
      date: "16/12/2024 - 13:09",
      backgroundColor: Colors.white,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Lịch sử hoạt động'),
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () {
              // Logic khi nhấn nút check
            },
          ),
        ],
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Column(
        children: [
          _buildSearchBar(),
          Expanded(
            child: ListView.builder(
              itemCount: _activityItems.length,
              itemBuilder: (context, index) {
                return _buildActivityItem(_activityItems[index]);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Tìm kiếm',
                prefixIcon: null, // Không cần biểu tượng bên trái
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(width: 1, color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                ),
                suffixIcon: IconButton( // Đặt biểu tượng bên phải của TextField
                  icon: const Icon(Icons.search),
                  onPressed: () {
                    // Thực hiện hành động tìm kiếm tại đây
                    print("Đã nhấn tìm kiếm");
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActivityItem(ActivityItem item) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      color: item.backgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              item.message,
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              item.date,
              style: const TextStyle(
                fontSize: 12,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
