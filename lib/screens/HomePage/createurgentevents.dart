import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UrgentEventsController extends GetxController {
  var donVi = "".obs;
  var khuVuc = "".obs;
  var mucDo = "".obs;
  var phamVi = "".obs;
  var nguoiTuanTra = "".obs;
  var moTaMoiNguy = "".obs;
  var huongGiaiQuyet = "".obs;

  void resetFields() {
    donVi.value = "";
    khuVuc.value = "";
    mucDo.value = "";
    phamVi.value = "";
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
              // DropdownButtonFormField cho Đơn vị
              Obx(
                    () => DropdownButtonFormField<String>(
                  value: controller.donVi.value.isNotEmpty ? controller.donVi.value : null,
                  decoration: const InputDecoration(
                    labelText: "Đơn vị (*)",
                    border: OutlineInputBorder(),
                  ),
                  items: ["PSP"].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    controller.donVi.value = value ?? "";
                  },
                ),
              ),
              const SizedBox(height: 16),

              // DropdownButtonFormField cho Khu vực
              Obx(
                    () => DropdownButtonFormField<String>(
                  value: controller.khuVuc.value.isNotEmpty ? controller.khuVuc.value : null,
                  decoration: const InputDecoration(
                    labelText: "Khu vực",
                    border: OutlineInputBorder(),
                  ),
                  items: ["5S"].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    controller.khuVuc.value = value ?? "";
                  },
                ),
              ),
              const SizedBox(height: 16),

              // DropdownButtonFormField cho Mức độ
              Obx(
                    () => DropdownButtonFormField<String>(
                  value: controller.mucDo.value.isNotEmpty ? controller.mucDo.value : null,
                  decoration: const InputDecoration(
                    labelText: "Mức độ (*)",
                    border: OutlineInputBorder(),
                  ),
                  items: ["Cao", "Trung bình", "Thấp"].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    controller.mucDo.value = value ?? "";
                  },
                ),
              ),
              const SizedBox(height: 16),

              // DropdownButtonFormField cho Phạm vi
              Obx(
                    () => DropdownButtonFormField<String>(
                  value: controller.phamVi.value.isNotEmpty ? controller.phamVi.value : null,
                  decoration: const InputDecoration(
                    labelText: "Phạm vi (*)",
                    border: OutlineInputBorder(),
                  ),
                  items: ["5S"].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (value) {
                    controller.phamVi.value = value ?? "";
                  },
                ),
              ),
              const SizedBox(height: 16),

              // TextFormField cho Người tuần tra
              Obx(
                    () => TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Người tuần tra (*)",
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    controller.nguoiTuanTra.value = value;
                  },
                ),
              ),
              const SizedBox(height: 16),

              // TextFormField cho Mô tả mối nguy
              Obx(
                    () => TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Mô tả mối nguy (*)",
                    border: OutlineInputBorder(),
                    helperText: "0 / 500 ký tự",
                  ),
                  maxLength: 500,
                  onChanged: (value) {
                    controller.moTaMoiNguy.value = value;
                  },
                ),
              ),
              const SizedBox(height: 16),

              // TextFormField cho Hướng giải quyết
              Obx(
                    () => TextFormField(
                  decoration: const InputDecoration(
                    labelText: "Hướng giải quyết",
                    border: OutlineInputBorder(),
                  ),
                  maxLines: 3,
                  onChanged: (value) {
                    controller.huongGiaiQuyet.value = value;
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
