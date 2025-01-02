import 'package:flutter/material.dart';
import 'package:flutter_taskscheduling_app/screens/HomePage/planslist.dart';
import 'package:get/get.dart';
import 'package:flutter_taskscheduling_app/screens/HomePage/activityhistory.dart';
import 'package:flutter_taskscheduling_app/screens/HomePage/createurgentevents.dart';

class HomeController extends GetxController {
  var isNotificationPressed = false.obs;  // Trạng thái của icon thông báo
  var isCalendarPressed = false.obs;  // Trạng thái của icon lịch trình
}

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    //Tạo controller để sử dụng GetX
    final HomeController controller = Get.put(HomeController());

    return Center(
      child: Container(
        width: double.infinity,  // Để chiếm hết chiều rộng
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        color: Colors.grey[200],  // Màu nền xám
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,  // Đưa Row lên trên cùng
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            buildReportHeaderRow(controller),
            const SizedBox(height: 16),
            buildReportCard(),// Gọi hàm xây dựng Row ở đây
          ],
        ),
      ),
    );
  }

  // Widget buildMainNavigation(HomeController controller) {
  //   return Scaffold(
  //       appBar: AppBar(
  //         title: Image.asset(
  //           'assets/images/abstergo_banner.png',
  //           height: 40,
  //           fit: BoxFit.contain,
  //         ),
  //         backgroundColor: Colors.white,
  //         actions: [
  //           OutlinedButton.icon(
  //             onPressed: () {
  //               Get.to(() => CreateUrgentEvents());
  //             },
  //             icon: const Icon(Icons.add, color: Colors.blue),
  //             label: const Text(
  //               "Kế hoạch",
  //               style: TextStyle(color: Colors.blue),
  //             ),
  //             style: OutlinedButton.styleFrom(
  //               side: const BorderSide(color: Colors.blue), // Màu viền nút
  //             ),
  //           ),
  //           const SizedBox(width: 8), // Khoảng cách giữa các nút
  //           OutlinedButton.icon(
  //             onPressed: () {
  //               // Thêm logic cho nút "Mối nguy" tại đây
  //             },
  //             icon: const Icon(Icons.add, color: Colors.red),
  //             label: const Text(
  //               "Mối nguy",
  //               style: TextStyle(color: Colors.red),
  //             ),
  //             style: OutlinedButton.styleFrom(
  //               side: const BorderSide(color: Colors.red), // Màu viền nút
  //             ),
  //           ),
  //         ],
  //       ),
  //   );
  // }

  /** BUILD HEADER REPORT **/
  Widget buildReportHeaderRow(HomeController controller) {
    return Row(
      children: [
        // Icon lịch sử hoạt động
        IconButton(
          onPressed: () {
            Get.to(() => ActivityHistory());
          },
          icon: Obx(() => Icon(
            Icons.notifications,
            color: controller.isNotificationPressed.value
                ? Colors.green
                : Colors.redAccent, // Đổi màu khi nhấn
          )),
        ),

        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,  // Căn giữa dọc
            crossAxisAlignment: CrossAxisAlignment.center, // Căn giữa ngang
            children: const [
              Text(
                "BÁO CÁO",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.redAccent,
                ),
              ),
              SizedBox(height: 4),
              Text(
                "Tháng 12 / 2024",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
        // Icon danh sách kế hoạch
        IconButton(
          onPressed: () {
            Get.to(() => PlansList());  // Thay đổi trạng thái
          },
          icon: Obx(() => Icon(
            Icons.calendar_today,
            color: controller.isCalendarPressed.value
                ? Colors.green
                : Colors.redAccent,  // Đổi màu khi nhấn
          )),
        ),
      ],
    );
  }


  /** BUILD PLAN **/
  Widget buildPlanRow(HomeController controller) {
    return Row(
      children: [
        // Icon thông báo
        IconButton(
          onPressed: () {
            controller.isNotificationPressed.toggle();  // Thay đổi trạng thái
          },
          icon: Obx(() => Icon(
            Icons.notifications,
            color: controller.isNotificationPressed.value
                ? Colors.green
                : Colors.redAccent,  // Đổi màu khi nhấn
          )),
        ),
        // Phần tiêu đề Báo Cáo và tháng/năm được căn giữa
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,  // Căn giữa dọc
            crossAxisAlignment: CrossAxisAlignment.center, // Căn giữa ngang
            children: const [
              Text(
                "BÁO CÁO",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.redAccent,
                ),
              ),
              SizedBox(height: 4),
              Text(
                "Tháng 12 / 2024",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
        ),
        // Icon lịch trình
        IconButton(
          onPressed: () {
            controller.isCalendarPressed.toggle();  // Thay đổi trạng thái
          },
          icon: Obx(() => Icon(
            Icons.calendar_today,
            color: controller.isCalendarPressed.value
                ? Colors.green
                : Colors.redAccent,  // Đổi màu khi nhấn
          )),
        ),
      ],
    );
  }

  /** BUILD REPORT CARD **/
  Widget buildReportCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 4.0,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Đã hoàn thành / Tổng CV
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Đã hoàn thành / Tổng CV",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              Text(
                "10 / 49",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 8),
          // Tỉ lệ hoàn thành
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Tỉ lệ hoàn thành",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              Text(
                "20%",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Đã xử lý / Tổng mối nguy
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Đã xử lý / Tổng mối nguy (Tỉ lệ %)",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              Text(
                "2 / 25 (8%)",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 16),
          // Trong đó
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              buildCardDetail("A", "1 / 19 (5%)", Colors.red),
              buildCardDetail("B", "1 / 5 (20%)", Colors.yellow),
              buildCardDetail("C", "0 / 1 (0%)", Colors.blue),
            ],
          ),
        ],
      ),
    );
  }

  /** BUILD CARD DETAIL **/
  Widget buildCardDetail(String title, String value, Color color) {
    return Column(
      children: [
        Container(
          width: 60,  // Chiều rộng của card hình chữ nhật
          height: 60, // Chiều cao của card hình chữ nhật
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: color.withOpacity(0.2),  // Màu nền nhạt hơn
            borderRadius: BorderRadius.circular(8.0),  // Bo tròn các góc
            border: Border.all(
              color: color,  // Đường viền sẽ có màu giống màu nền của card
              width: 2.0,  // Độ dày của đường viền
            ),
          ),
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.black,  // Màu chữ đậm
              fontWeight: FontWeight.bold,
              fontSize: 16,  // Cỡ chữ phù hợp cho card
            ),
          ),
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }
}
