import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'signup.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter_taskscheduling_app/services/APIServices.dart';
import 'package:flutter_taskscheduling_app/screens/HomePage/homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_taskscheduling_app/main.dart';

class LoginController extends GetxController {
  var email = ''.obs;
  var password = ''.obs;

  Future<void> login() async {
    if (email.value.isEmpty || password.value.isEmpty) {
      Get.snackbar(
        "Lỗi",
        "Vui lòng điền đầy đủ thông tin!",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return;
    }

    // Gửi yêu cầu đến API
    ApiService().login(email.value, password.value).then((response) async {
      if (response['result'] == 1) {
        // Lưu accessToken
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('accessToken', response['accessToken']);

        Get.snackbar(
          "Thành công",
          response['msg'] ?? "Đăng nhập thành công!",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );

        // Điều hướng về HomePage
        Get.off(() => const MainNavigation());
      } else {
        Get.snackbar(
          "Lỗi",
          response['msg'] ?? "Đăng nhập thất bại!",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
      }
    }).catchError((error) {
      Get.snackbar(
        "Lỗi",
        "Đã xảy ra lỗi: $error",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    });
  }
}


class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    final LoginController login = Get.put(LoginController());

    return Scaffold(
      backgroundColor: Colors.red.shade50,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Căn giữa nội dung theo chiều dọc
            children: [
              Container(
                width: 350,
                padding: const EdgeInsets.all(20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.asset(
                      'assets/images/abstergo_industries_logo.png',
                      // height: 60,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'Chào mừng quay trở lại',
                      style: TextStyle(
                        color: const Color(0xFFFF3131),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 50),
                    TextField(
                      onChanged: (value) {
                        login.email.value = value; // Cập nhật giá trị email
                      },
                      decoration: InputDecoration(
                        labelText: 'Email',
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
                        prefixIcon: const Icon(Icons.email),
                      ),
                    ),
                    const SizedBox(height: 15),
                    TextField(
                      obscureText: true,
                      onChanged: (value) {
                        login.password.value = value; // Cập nhật giá trị password
                      },
                      decoration: InputDecoration(
                        labelText: 'Mật khẩu',
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
                        prefixIcon: const Icon(Icons.lock),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          // Hành động khi nhấn "Quên mật khẩu"
                        },
                        child: const Text(
                          'Quên mật khẩu',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        final loginController = Get.find<LoginController>();
                        loginController.login(); // Gọi phương thức login từ instance
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red.shade400,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 50),
                      ),
                      child: const Text(
                        'Đăng Nhập',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      ),
                    ),
                    const SizedBox(height: 20),
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

                              text: ' Đăng ký',
                              style: TextStyle(

                                color: const Color(0xFFFF3131),
                                fontWeight: FontWeight.bold,
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(builder: (context) => const RegistrationPage()),
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
            ],
          ),
        ),
      ),
    );
  }
}
