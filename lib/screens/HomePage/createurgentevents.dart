import 'package:flutter/material.dart';
import 'package:flutter_taskscheduling_app/main.dart';
import 'package:screenshot/screenshot.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';
import 'dart:typed_data'; // Thêm import cho Uint8List

class UrgentEventsController extends GetxController {
  var mucDo = "".obs;
  var nguoiTuanTra = "".obs;
  var moTaMoiNguy = "".obs;
  var huongGiaiQuyet = "".obs;
  var imageData = Rxn<Uint8List>(); // Biến lưu trữ hình ảnh

  void resetFields() {
    mucDo.value = "";
    nguoiTuanTra.value = "";
    moTaMoiNguy.value = "";
    huongGiaiQuyet.value = "";
    imageData.value = null; // Reset lại hình ảnh
  }

  bool isFormValid() {
    return mucDo.value.isNotEmpty &&
        nguoiTuanTra.value.isNotEmpty &&
        moTaMoiNguy.value.isNotEmpty;
  }
}

class CreateUrgentEvents extends StatelessWidget {
  CreateUrgentEvents({Key? key}) : super(key: key);

  final UrgentEventsController controller = Get.put(UrgentEventsController());
  final ScreenshotController screenshotController = ScreenshotController(); // Khai báo ScreenshotController

  // Hàm mở camera và chụp ảnh
  Future<void> _takePicture() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.camera);
    if (image != null) {
      controller.imageData.value = await image.readAsBytes(); // Lưu ảnh vào controller
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tạo mối nguy"),
        actions: [
          IconButton(
            onPressed: () {
              controller.resetFields();
            },
            icon: const Icon(Icons.refresh),
            tooltip: "Làm mới",
          ),
          IconButton(
            onPressed: () async {
              // Lấy ảnh chụp màn hình
              Uint8List? screenshot = await screenshotController.capture();
              if (screenshot != null) {
                // Lưu hình ảnh vào biến imageData
                controller.imageData.value = screenshot;
                print("Chụp màn hình thành công!");
              }
            },
            icon: const Icon(Icons.camera_alt),
            tooltip: "Chụp màn hình",
          ),
        ],
      ),
      body: Screenshot( // Bọc toàn bộ widget bạn muốn chụp vào Screenshot
        controller: screenshotController, // Gắn ScreenshotController vào đây
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // DropdownButtonFormField cho Mức độ
                      Obx(() {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Mức độ (*)", style: TextStyle(fontSize: 16)),
                            DropdownButtonFormField<String>(
                              value: controller.mucDo.value.isNotEmpty
                                  ? controller.mucDo.value
                                  : null,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                              ),
                              items: [
                                {"value": "A", "title": "Cao"},
                                {"value": "B", "title": "Trung Bình"},
                                {"value": "C", "title": "Thấp"},
                              ].map((Map<String, String> item) {
                                return DropdownMenuItem<String>(
                                  value: item["value"],
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(item["value"] ?? "",
                                          style: const TextStyle(fontWeight: FontWeight.bold)),
                                      Text(item["title"] ?? "",
                                          style: const TextStyle(fontSize: 12, color: Colors.grey)),
                                    ],
                                  ),
                                );
                              }).toList(),
                              onChanged: (value) {
                                controller.mucDo.value = value ?? "";
                              },
                            ),
                          ],
                        );
                      }),

                      const SizedBox(height: 16),

                      // Label và TextFormField cho Người tuần tra
                      const Text("Người tuần tra (*)", style: TextStyle(fontSize: 16)),
                      TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (value) {
                          controller.nguoiTuanTra.value = value;
                        },
                      ),

                      const SizedBox(height: 16),

                      // Label và TextFormField cho Mô tả mối nguy
                      Obx(() {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Mô tả mối nguy (*)", style: TextStyle(fontSize: 16)),
                            TextFormField(
                              decoration: InputDecoration(
                                border: const OutlineInputBorder(),
                                helperText: "${controller.moTaMoiNguy.value.length} / 500 ký tự",
                              ),
                              maxLength: 500,
                              onChanged: (value) {
                                controller.moTaMoiNguy.value = value;
                              },
                            ),
                          ],
                        );
                      }),

                      const SizedBox(height: 16),

                      // Label và TextFormField cho Hướng giải quyết
                      const Text("Hướng giải quyết", style: TextStyle(fontSize: 16)),
                      TextFormField(
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                        maxLines: 3,
                        onChanged: (value) {
                          controller.huongGiaiQuyet.value = value;
                        },
                      ),

                      const SizedBox(height: 16),

                      // Hiển thị hình ảnh mối nguy (nếu có)
                      Obx(() {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Hình ảnh mối nguy", style: TextStyle(fontSize: 16)),
                            // Hiển thị ảnh nếu có
                            controller.imageData.value != null
                                ? SizedBox(
                              height: 200,
                              child: Image.memory(controller.imageData.value!),
                            )
                                : const Text("Chưa có hình ảnh mối nguy."),
                          ],
                        );
                      }),
                    ],
                  ),
                ),
              ),
            ),

            // Phần nút
            Padding(
              padding: const EdgeInsets.all(32.0),
              child: Column(
                children: [
                  // Nút "Chụp ảnh mối nguy"
                  Row(
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
                            await _takePicture(); // Gọi hàm mở camera khi nhấn nút
                          },
                          child: const Center(
                            child: Text("Chụp ảnh mối nguy"),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  // Nút "Gửi"
                  Row(
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
                            if (controller.isFormValid()) {
                              Get.to(() => UploadedUrgentEventPage());
                            } else {
                              Get.snackbar(
                                "Thông báo",
                                "Thông tin tạo mối nguy không đầy đủ",
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: Colors.red,
                                colorText: Colors.white,
                              );
                            }
                          },
                          child: const Center(
                            child: Text("Gửi"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}

class UploadedUrgentEventPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mối nguy đã được đăng tải"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Mối nguy đã được đăng tải thành công!",
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
                Get.off(() => CreateUrgentEvents()); // Điều hướng về trang tạo mối nguy mới
              },
              child: const Text("Tạo mối nguy mới"),
            ),
          ],
        ),
      ),
    );
  }
}
