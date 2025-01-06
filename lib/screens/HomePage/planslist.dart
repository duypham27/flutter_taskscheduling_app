import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter_taskscheduling_app/services/APIServices.dart';

class PlansListController extends GetxController {
  var isFilterPressed = false.obs; // Trạng thái của icon lọc
  var searchText = "".obs;
  var selectedStatus = "Tất cả trạng thái".obs; // Trạng thái đã chọn
  var selectedDate = DateTime.now().obs; // Ngày đã chọn

  var tasks = <Map<String, dynamic>>[].obs; // Lưu kế hoạch từ API
  var isLoading = false.obs; // Trạng thái loading

  // Hàm để lấy danh sách task từ API
  Future<void> getTasks(String? search, String? status) async {
    try {
      //isLoading.value = true;
      // Gọi API listTask từ ApiService với tham số search, status, due_date
      var taskList = await ApiService().listTask(
          search, status
      );

      if (taskList != null) {
        tasks.value = (taskList as List).map((item) {
          var task = Map<String, dynamic>.from(item);
          task['id'] = task['id'].toString(); // Ép kiểu id thành String
          return task;
        }).toList();
      } else {
        Get.snackbar(
          'Lỗi',
          'Không thể lấy danh sách công việc!',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      debugPrint('Lỗi: $e'); // In lỗi ra console
      Get.snackbar(
        'Lỗi',
        'Có lỗi xảy ra khi lấy dữ liệu.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

}

class PlansList extends StatelessWidget {
  const PlansList({super.key});

  @override
  Widget build(BuildContext context) {
    // Tạo controller để sử dụng GetX
    final PlansListController controller = Get.put(PlansListController());
    // Gọi phương thức fetchTasks() khi giao diện được tải
    controller.getTasks(null, null);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Danh Sách Kế Hoạch"),
        backgroundColor: Colors.redAccent,
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
              buildCalendarAndStatusFilter(controller, context),
              const SizedBox(height: 16),
              buildSearchBar(controller),// Gọi hàm tạo lịch và bộ lọc trạng thái
              const SizedBox(height: 16),
              //buildHistoryList(),
              // Sử dụng Obx để lắng nghe sự thay đổi của tasks và hiển thị danh sách kế hoạch
              Obx(() {
                if (controller.isLoading.value) {
                  return const CircularProgressIndicator(); // Hiển thị loading
                }
                return buildHistoryList(controller.tasks);
              }),
            ],
          ),
        ),
      ),
    );
  }

  // Widget tạo nút chọn lịch và nút chọn trạng thái
  Widget buildCalendarAndStatusFilter(PlansListController controller, BuildContext context) {
    return Row(
      children: [
        // Nút chọn lịch
        Expanded(
          child: ElevatedButton(
            onPressed: () async {
              DateTime? selectedDay = await showDatePicker(
                context: context, // Sử dụng context từ widget
                initialDate: controller.selectedDate.value,
                firstDate: DateTime(2020),
                lastDate: DateTime(2030),
              );
              if (selectedDay != null && selectedDay != controller.selectedDate.value) {
                controller.selectedDate.value = selectedDay;
              }
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center, // Căn giữa nội dung trong nút
              children: [
                Obx(() => Text(
                  "Tháng ${controller.selectedDate.value.month} / ${controller.selectedDate.value.year}", // Hiển thị tháng và năm
                  style: const TextStyle(fontSize: 14),
                )),
                const SizedBox(width: 8), // Khoảng cách giữa văn bản và biểu tượng
                Icon(Icons.arrow_drop_down, color: Colors.black),
              ],
            ),
          ),
        ),

        // Khoảng cách giữa các nút
        const SizedBox(width: 16),

        // Nút chọn trạng thái
        Expanded(
          child: ElevatedButton(
            onPressed: () {
              showDialog(
                context: context, // Sử dụng context từ widget
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text("Chọn trạng thái"),
                    content: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ListTile(
                          title: const Text("Tất cả trạng thái"),
                          onTap: () {
                            controller.selectedStatus.value = "Tất cả trạng thái";
                            Navigator.of(context).pop();
                          },
                        ),
                        ListTile(
                          title: const Text("Đang xử lý"),
                          onTap: () {
                            controller.selectedStatus.value = "Đang xử lý";
                            Navigator.of(context).pop();
                          },
                        ),
                        ListTile(
                          title: const Text("Hoàn thành"),
                          onTap: () {
                            controller.selectedStatus.value = "Hoàn thành";
                            Navigator.of(context).pop();
                          },
                        ),
                        ListTile(
                          title: const Text("Huỷ"),
                          onTap: () {
                            controller.selectedStatus.value = "Huỷ";
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center, // Căn giữa nội dung trong nút
              children: [
                Obx(() => Text(
                  controller.selectedStatus.value,
                  style: const TextStyle(fontSize: 14),
                )),
                const SizedBox(width: 8), // Khoảng cách giữa văn bản và biểu tượng
                Icon(Icons.arrow_drop_down, color: Colors.black),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget buildSearchBar(PlansListController controller) {
    return TextField(
      onChanged: (value) {
        controller.searchText.value = value; // Cập nhật giá trị tìm kiếm
      },
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.search),
        hintText: "Tìm kiếm kế hoạch...",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        filled: true,
        fillColor: Colors.white,
      ),
    );
  }



  /** BUILD PLANS LIST **/
  Widget buildHistoryList(RxList<Map<String, dynamic>> plans) {
    // final List<Map<String, dynamic>> plans = [
    //   {
    //     "id": "#AVNTA00825",
    //     "name": "KH tuần tra",
    //     "startDate": "11/12/2024",
    //     "status": "Huỷ",
    //     "statusColor": Colors.red,
    //     "avatar": "https://via.placeholder.com/40"
    //   },
    //   {
    //     "id": "#AVNTA00483",
    //     "name": "Kế hoạch A BC",
    //     "startDate": "05/12/2024",
    //     "status": "Đang xử lý",
    //     "statusColor": Colors.orange,
    //     "avatar": "https://via.placeholder.com/40"
    //   },
    //   {
    //     "id": "#AVNTA00823",
    //     "name": "Kế hoạch test",
    //     "startDate": "11/12/2024",
    //     "status": "Hoàn thành",
    //     "statusColor": Colors.green,
    //     "avatar": "https://via.placeholder.com/40"
    //   },
    //   {
    //     "id": "#AVNTA00790",
    //     "name": "Kế hoạch a",
    //     "startDate": "11/12/2024",
    //     "status": "Đang xử lý",
    //     "statusColor": Colors.orange,
    //     "avatar": "https://via.placeholder.com/40"
    //   },
    // ];

    return Expanded(
      child: ListView.builder(
        itemCount: plans.length,
        itemBuilder: (context, index) {
          final plan = plans[index];
          return buildPlanCard(
            plan["id"] ?? "",
            plan["title"] ?? "",
            plan["due_date"] ?? "",
            plan["status"] ?? "",
            plan["statusColor"] ?? Colors.grey,
            plan["avatar"] ?? "",
          );
        },
      ),
    );
  }

  /** BUILD PLANS CARD **/
  Widget buildPlanCard(String id, String name, String startDate, String status, Color statusColor, String avatarUrl) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    id,
                    style: TextStyle(
                      fontSize: 12,
                      color: statusColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  status,
                  style: TextStyle(
                    fontSize: 12,
                    color: statusColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              name,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Ngày bắt đầu: $startDate",
                        style: const TextStyle(
                          fontSize: 12,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
                CircleAvatar(
                  backgroundImage: NetworkImage(avatarUrl),
                  radius: 16,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

}
