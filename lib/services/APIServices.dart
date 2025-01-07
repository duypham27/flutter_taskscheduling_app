import 'dart:convert'; // Chuyển đổi JSON
import 'package:http/http.dart' as http; // Thư viện HTTP
import 'package:flutter_taskscheduling_app/models/user.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
class ApiService {
  static const String baseUrl = "http://10.0.2.2/API_Mobile";
  //static const String readDeviceUrl = "http://192.168.155.238:80/API_Mobile";
  //static const String readDeviceUrl = "http://192.168.1.3:80/API_Mobile";
  // Phương thức gửi yêu cầu POST để đăng nhập
  Future<Map<String, dynamic>> login(String email, String password) async {
    final url = Uri.parse("$baseUrl/login");
    final headers = {"Content-Type": "application/x-www-form-urlencoded"};
    final body = {
      "email": email,
      "password": password,
    };

    try {
      final response = await http.post(url, headers: headers, body: body);
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);

        // Kiểm tra nếu trả về accessToken
        if (responseData['result'] == 1 && responseData['accessToken'] != null) {
          final accessToken = responseData['accessToken'];

          // Lưu accessToken vào SharedPreferences
          final prefs = await SharedPreferences.getInstance();
          await prefs.setString('access_token', accessToken);
          // Test ccessToken vào SharedPreferences
          Get.snackbar(
            "Đăng nhập thành công",
            "AccessToken của bạn: $accessToken",
            snackPosition: SnackPosition.BOTTOM,
            backgroundColor: Colors.green,
            colorText: Colors.white,
            duration: const Duration(seconds: 5),
          );
          /////

          return responseData; // Trả về dữ liệu từ API
        } else {
          throw Exception(responseData['msg'] ?? "Login failed.");
        }
      } else {
        throw Exception("Error: ${response.statusCode} - ${response.reasonPhrase}");
      }
    } catch (e) {
      throw Exception("API Error: $e");
    }
  }
  Future<Map<String, dynamic>> signup(UserModel user,String password) async {

    final url = Uri.parse("$baseUrl/signup");
    final headers = {
      "Content-Type": "application/x-www-form-urlencoded",
    };

    final body = {
      'email': user.email,
      'username': user.username,
      'password': password,
      'created_at': user.createdAt,
      'updated_at': user.updatedAt,
    };

    try {
      // Gửi request POST
      final response = await http.post(url, headers: headers, body: body);

      if (response.statusCode == 200) {
        return jsonDecode(response.body); // Trả về dữ liệu JSON từ API
      } else {
        throw Exception("Error: ${response.statusCode} - ${response.reasonPhrase}");
      }
    } catch (e) {
      throw Exception("API Error: $e");
    }
  }

  // Lay danh sach task

  Future<List<Map<String, dynamic>>> listTask(
      String? search,
      String? status,

      ) async{
    final urlString = Uri.parse("$baseUrl/tasks");
    Map<String, String> queryParams = {};

    if (search != null && search.isNotEmpty) {
      queryParams['search'] = search;
    }
    if (status != null && status.isNotEmpty) {
      queryParams['status'] = status;
    }
    // if (due_date != null && due_date.isNotEmpty) {
    //   queryParams['due_date'] = due_date;
    // }

    final url = urlString.replace(queryParameters: queryParams);
    try {
      // Lấy accessToken từ SharedPreferences
      final prefs = await SharedPreferences.getInstance();
      final accessToken = prefs.getString('access_token');

      if (accessToken == null) {
        throw Exception("Access token không tồn tại. Vui lòng đăng nhập lại.");
      }

      // Thêm accessToken vào header
      final headers = {
        'Authorization': accessToken,
        'Content-Type': 'application/json',
      };

      // Gửi request GET đến API
      final response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);


        var result = responseData['result'];
        var quantity = responseData['quantity'];
        var descriptions = (responseData['data'] as List)
            .map((task) => task['description'] ?? 'Không có mô tả')
            .toList();

        // Gộp danh sách mô tả thành chuỗi
        var descriptionText = descriptions.join(', ');

        Get.snackbar(
          'Thông tin JSON',
          'Result: $result, Quantity: $quantity, Descriptions: $descriptionText',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.blueAccent,
          colorText: Colors.white,
          duration: Duration(seconds: 5), // Thời gian hiển thị
        );
        // Xử lý và trả về danh sách Task
        if (responseData['result'] == 1) {
          // Trả về danh sách task từ mảng 'data'
          final tasks = responseData['data'] as List;
          return tasks.map((task) => task as Map<String, dynamic>).toList();
        } else {
          throw Exception("Lỗi từ API: Không có dữ liệu.");
        }
      } else {
        // Trả về lỗi từ API
        throw Exception("Lỗi: ${response.statusCode} - ${response.reasonPhrase}");
      }

    }
    catch (e) {
      // Xử lý lỗi không mong muốn
      throw Exception("Lỗi khi gọi API: $e");
    }

  }



}
