import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ActivityHistoryController extends GetxController {
  var isFilterPressed = false.obs; // Trạng thái của icon lọc
}

class ActivityHistory extends StatelessWidget {
  const ActivityHistory({super.key});

  @override
  Widget build(BuildContext context) {
    // Tạo controller để sử dụng GetX
    final ActivityHistoryController controller = Get.put(ActivityHistoryController());

    return Scaffold(
      appBar: AppBar(
        title: const Text("Lịch Sử Hoạt Động"),
        backgroundColor: Colors.redAccent,
        actions: [
          IconButton(
            onPressed: () {
              controller.isFilterPressed.toggle(); // Thay đổi trạng thái
            },
            icon: Obx(() => Icon(
              Icons.filter_list,
              color: controller.isFilterPressed.value ? Colors.green : Colors.white, // Đổi màu khi nhấn
            )),
          ),
        ],
      ),
      body: Center(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          color: Colors.grey[200],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              buildHistoryList(),
            ],
          ),
        ),
      ),
    );
  }

  /** BUILD HISTORY LIST **/
  Widget buildHistoryList() {
    final List<Map<String, String>> historyData = [
      {"date": "01/12/2024", "details": "Hoàn thành báo cáo tháng 12."},
      {"date": "28/11/2024", "details": "Xử lý nguy cơ nhóm A."},
      {"date": "15/11/2024", "details": "Cập nhật kế hoạch năm mới."},
    ];

    return Expanded(
      child: ListView.builder(
        itemCount: historyData.length,
        itemBuilder: (context, index) {
          final item = historyData[index];
          return buildHistoryCard(item["date"] ?? "", item["details"] ?? "");
        },
      ),
    );
  }

  /** BUILD HISTORY CARD **/
  Widget buildHistoryCard(String date, String details) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              date,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.redAccent,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              details,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black54,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
