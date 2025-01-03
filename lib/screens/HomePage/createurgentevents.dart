import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart' as quill;
import 'package:get/get.dart';

class UrgentEventsController extends GetxController {
  var mucDo = "".obs;
  var nguoiTuanTra = "".obs;
  var moTaMoiNguy = "".obs;
  var huongGiaiQuyet = "".obs;

  void resetFields() {
    mucDo.value = "";
    nguoiTuanTra.value = "";
    moTaMoiNguy.value = "";
    huongGiaiQuyet.value = "";
  }
}

class CreateUrgentEvents extends StatelessWidget {
  CreateUrgentEvents({Key? key}) : super(key: key);

  final UrgentEventsController controller = Get.put(UrgentEventsController());

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
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // DropdownButtonFormField cho Mức độ
              Obx(() {
                return DropdownButtonFormField<String>(
                  value: controller.mucDo.value.isNotEmpty ? controller.mucDo.value : null,
                  decoration: const InputDecoration(
                    labelText: "Mức độ (*)",
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
                          Text(item["value"] ?? "", style: const TextStyle(fontWeight: FontWeight.bold)),
                          Text(item["title"] ?? "", style: const TextStyle(fontSize: 12, color: Colors.grey)),
                        ],
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    controller.mucDo.value = value ?? "";
                  },
                );
              }),

              const SizedBox(height: 16),

              // TextFormField cho Người tuần tra
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Người tuần tra (*)",
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  controller.nguoiTuanTra.value = value;
                },
              ),

              const SizedBox(height: 16),

              // TextFormField cho Mô tả mối nguy
              Obx(() {
                return TextFormField(
                  decoration: InputDecoration(
                    labelText: "Mô tả mối nguy (*)",
                    border: const OutlineInputBorder(),
                    helperText: "${controller.moTaMoiNguy.value.length} / 500 ký tự",
                  ),
                  maxLength: 500,
                  onChanged: (value) {
                    controller.moTaMoiNguy.value = value;
                  },
                );
              }),

              const SizedBox(height: 16),

              // TextFormField cho Hướng giải quyết
              TextFormField(
                decoration: const InputDecoration(
                  labelText: "Hướng giải quyết",
                  border: OutlineInputBorder(),
                ),
                maxLines: 3,
                onChanged: (value) {
                  controller.huongGiaiQuyet.value = value;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
