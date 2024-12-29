import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'login.dart';
import 'package:flutter/gestures.dart';


class RegistrationController extends GetxController {
  var name = ''.obs;
  var email = ''.obs;
  var password = ''.obs;

  void register() {
    // Xử lý logic đăng ký,
    if (name.isNotEmpty && email.isNotEmpty && password.isNotEmpty) {
      Get.snackbar(
        "Thành công",
        "Đăng ký thành công!",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
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
      backgroundColor: Colors.red.shade50,
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
                  color: Colors.redAccent,
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
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      color: const Color(0xFFFF3131), // Màu cam cho border khi focus
                      width: 1.3,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      color: const Color(0xFFFF3131), // Màu cam cho border khi không focus
                      width: 1.0,
                    ),
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
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      color: const Color(0xFFFF3131), // Màu cam cho border khi focus
                      width: 1.3,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      color: const Color(0xFFFF3131), // Màu cam cho border khi không focus
                      width: 1.0,
                    ),
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
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      color: const Color(0xFFFF3131), // Màu cam cho border khi focus
                      width: 1.3,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      color: const Color(0xFFFF3131), // Màu cam cho border khi không focus
                      width: 1.0,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: controller.register,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.redAccent,
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
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  // Điều hướng đến màn hình đăng ký
                  Get.snackbar("Thông báo", "Điều hướng đến màn hình đăng ký.");
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