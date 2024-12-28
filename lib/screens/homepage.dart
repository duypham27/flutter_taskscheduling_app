import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  var isNotificationPressed = false.obs;  // Trạng thái của icon thông báo
  var isCalendarPressed = false.obs;  // Trạng thái của icon lịch trình
}

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    // Tạo controller để sử dụng GetX
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
            buildReportHeaderRow(controller), // Gọi hàm xây dựng Row ở đây
          ],
        ),
      ),
    );
  }

  /** BUIDLD HEADER REPORT **/
  Widget buildReportHeaderRow(HomeController controller) {
    return Row(
      children: [
        // Icon notification
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
        // Icon lich
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


  /** BUIDLD PLAN **/
  Widget buildPlanRow(HomeController controller) {
    return Row(
      children: [
        // Icon thông báo bên trái
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
        // Icon lịch trình bên phải
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
}
