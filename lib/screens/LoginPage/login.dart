import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'singup.dart';
import 'package:flutter/gestures.dart';



class LoginController extends GetxController {

  var email = ''.obs;
  var password = ''.obs;

  void login() {
    // Xử lý logic đăng ký,
    if (email.isNotEmpty && password.isNotEmpty) {
      Get.snackbar(
        "Thành công",
        "Đăng nhap thành công!",
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
                // decoration: BoxDecoration(
                //   color: Colors.white,
                //   borderRadius: BorderRadius.circular(15),
                //   boxShadow: [
                //     BoxShadow(
                //       color: Colors.black26,
                //       blurRadius: 10,
                //       offset: Offset(0, 5),
                //     ),
                //   ],
                // ),
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
                        // Hành động khi nhấn nút "Đăng Nhập"
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
