import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_taskscheduling_app/main.dart';
import 'package:intl/intl.dart';
import 'package:flutter_taskscheduling_app/services/APIServices.dart';

class CreatePlanController extends GetxController {
  var planName = "".obs;
  var planDescription = "".obs;
  var startDate = "".obs; // Đổi từ deadline -> startDate

  var isLoading = false.obs;

  // Hàm để định dạng ngày thành yyyy/MM/dd trước khi gửi API
  String getFormattedDate(String inputDate) {
    try {
      // Chuyển từ chuỗi input (1/2/2025) sang DateTime
      final parsedDate = DateFormat('d/M/yyyy').parse(inputDate);

      // Chuyển sang định dạng yyyy/MM/dd
      final formatter = DateFormat('yyyy-MM-dd');
      return formatter.format(parsedDate);
    } catch (e) {
      throw Exception("Định dạng ngày không hợp lệ. Vui lòng nhập đúng định dạng.");
    }
  }
  Future<void> submitPlan() async {
    if (planName.value.isEmpty ||
        planDescription.value.isEmpty ||
        startDate.value.isEmpty) {
      Get.snackbar(
        "Lỗi",
        "Vui lòng điền đầy đủ thông tin.",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    try {
      isLoading.value = true;

      // Định dạng lại startDate
      final formattedStartDate = getFormattedDate(startDate.value);

      final result = await ApiService().addTask(
        planName.value,
        planDescription.value,
        formattedStartDate,
      );

      if (result['result'] == 1) {
        Get.snackbar(
          "Thành công",
          "Kế hoạch đã được thêm thành công.",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );
        resetFields();
        Get.to(() => UploadedPlanPage());
      } else {
        Get.snackbar(
          "Lỗi",
          result['message'] ?? "Có lỗi xảy ra.",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    } catch (e) {
      Get.snackbar(
        "Lỗi",
        "Không thể thêm kế hoạch: $e",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  void resetFields() {
    planName.value = "";
    planDescription.value = "";
    startDate.value = "";
  }

  bool isFormValid() {
    return planName.value.isNotEmpty &&
        planDescription.value.isNotEmpty &&
        startDate.value.isNotEmpty;
  }

}

class CreatePlan extends StatelessWidget {
  final CreatePlanController controller = Get.put(CreatePlanController());

  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(), // Ngày mặc định là ngày hiện tại
      firstDate: DateTime(2000), // Giới hạn ngày nhỏ nhất
      lastDate: DateTime(2100), // Giới hạn ngày lớn nhất
    );

    if (pickedDate != null) {
      // Cập nhật giá trị đã chọn vào TextFormField
      controller.startDate.value =
      "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tạo Kế Hoạch"),
        actions: [
          IconButton(
            onPressed: () {
              controller.resetFields();
            },
            icon: const Icon(Icons.refresh),
            tooltip: "Làm mới",
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Tên Kế Hoạch
                  const Text("Tên Kế Hoạch (*)", style: TextStyle(fontSize: 16)),
                  TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value) {
                      controller.planName.value = value;
                    },
                  ),
                  const SizedBox(height: 16),

                  // Mô Tả Kế Hoạch
                  const Text("Mô Tả Kế Hoạch (*)", style: TextStyle(fontSize: 16)),
                  TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                    maxLines: 3,
                    onChanged: (value) {
                      controller.planDescription.value = value;
                    },
                  ),
                  const SizedBox(height: 16),

                  // Ngày Bắt Đầu
                  const Text("Ngày Bắt Đầu (*)", style: TextStyle(fontSize: 16)),
                  Obx(
                        () => TextFormField(
                      readOnly: true, // Không cho phép nhập trực tiếp
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: "dd/mm/yyyy",
                      ),
                      controller: TextEditingController(
                          text: controller.startDate.value), // Hiển thị giá trị
                      onTap: () => _selectDate(context), // Mở DatePicker
                    ),
                  ),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ),

          // Nút Gửi
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      textStyle: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () async {
                      // if (controller.isFormValid()) {
                      //   Get.to(() => UploadedPlanPage());
                      // } else {
                      //   Get.snackbar(
                      //     "Thông báo",
                      //     "Thông tin tạo kế hoạch không đầy đủ",
                      //     snackPosition: SnackPosition.BOTTOM,
                      //     backgroundColor: Colors.red,
                      //     colorText: Colors.white,
                      //   );
                      // }
                      await controller.submitPlan();
                    },
                    child: const Center(
                      child: Text("Gửi"),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class UploadedPlanPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Kế hoạch đã được đăng tải"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Kế hoạch đã được đăng tải thành công!",
              textAlign: TextAlign.center, // Căn giữa văn bản khi xuống dòng
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Colors.green, // Đổi màu thành xanh lá
              ),
            ),



            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                // Quay về Trang Chủ
                Get.back();
                Get.off(() => MainNavigation());
              },
              child: const Text("Quay về Trang Chủ"),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                // Tạo mối nguy mới
                Get.back(); // Trở lại trang tạo mối nguy
                Get.off(() => CreatePlan()); // Điều hướng về trang tạo mối nguy mới
              },
              child: const Text("Tạo mối nguy mới"),
            ),
          ],
        ),
      ),
    );
  }
}
