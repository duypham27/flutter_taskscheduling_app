import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'login.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_taskscheduling_app/models/user.dart';
import 'package:flutter_taskscheduling_app/services/APIServices.dart';


class RegistrationController extends GetxController {
  var name = ''.obs;
  var email = ''.obs;
  var password = ''.obs;

  // Thêm trạng thái để theo dõi việc tải dữ liệu
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  Future<void> register() async {
    if (name.isNotEmpty && email.isNotEmpty && password.isNotEmpty) {
      isLoading.value = true;
      errorMessage.value = '';

      // Tạo đối tượng UserModel từ dữ liệu nhập vào
      final user = UserModel(
        id: 0,  // ID sẽ được tạo tự động từ API nếu cần
        email: email.value,
        username: name.value,
        createdAt: "",  // Nếu API yêu cầu các trường này, có thể điền
        updatedAt: "",
      );


      try {
        // Gọi API đăng ký
        final result = await ApiService().signup(user,password.value);

        if (result['result'] == 1) {
          // Thông báo thành công và điều hướng
          Get.snackbar(
            "Thành công",
            "Đăng ký thành công!",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            colorText: Colors.white,
          );
          // Chuyển đến trang đăng nhập hoặc trang khác sau khi đăng ký thành công
          Get.toNamed('/login');
        } else {
          errorMessage.value = result['msg'] ?? 'Đăng ký không thành công!';
        }
      } catch (e) {
        errorMessage.value = "Lỗi kết nối: $e";
      } finally {
        isLoading.value = false;
      }
    } else {
      Get.snackbar(
        "Lỗi",
        "Vui lòng điền đầy đủ thông tin!",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final RegistrationController controller = Get.put(RegistrationController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Chào mừng thành viên mới",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 30),
              TextField(
                onChanged: (value) => controller.name.value = value,
                decoration: InputDecoration(
                  labelText: "Tên",
                  labelStyle: TextStyle(
                    color: Color(0xFFC9B5A6), // Màu chữ Email
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                onChanged: (value) => controller.email.value = value,
                decoration: InputDecoration(
                  labelText: "Email",
                  labelStyle: TextStyle(
                    color: Color(0xFFC9B5A6), // Màu chữ Email
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                onChanged: (value) => controller.password.value = value,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Mật khẩu",
                  labelStyle: TextStyle(
                    color: Color(0xFFC9B5A6), // Màu chữ Email
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              Obx(() {
                return controller.isLoading.value
                    ? CircularProgressIndicator() // Hiển thị vòng tròn tải nếu đang gửi yêu cầu
                    : ElevatedButton(
                  onPressed: controller.register,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 100,
                      vertical: 16,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: const Text(
                    "Đăng Ký",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                );
              }),
              const SizedBox(height: 16),
              Obx(() {
                if (controller.errorMessage.isNotEmpty) {
                  return Text(
                    controller.errorMessage.value,
                    style: TextStyle(color: Colors.red),
                  );
                }
                return SizedBox.shrink();
              }),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  // Điều hướng đến màn hình đăng nhập
                  Get.snackbar("Thông báo", "Điều hướng đến màn hình đăng nhập.");
                },
                child: Text.rich(
                  TextSpan(
                    text: 'Bạn đã có tài khoản? Hãy',
                    style: TextStyle(color: const Color(0xFFFF3131)),
                    children: [
                      TextSpan(
                        text: ' Đăng nhâp',
                        style: TextStyle(
                          color: const Color(0xFFFF3131),
                          fontWeight: FontWeight.bold,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => const Login()),
                            );
                          },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}