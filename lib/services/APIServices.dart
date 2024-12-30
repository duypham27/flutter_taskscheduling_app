import 'dart:convert'; // Chuyển đổi JSON
import 'package:http/http.dart' as http; // Thư viện HTTP
import 'package:flutter_taskscheduling_app/models/user.dart';
class ApiService {
  static const String baseUrl = "http://10.0.2.2/API_Mobile";
  static const String readDeviceUrl = "http://192.168.1.3/API_Mobile";
  // Phương thức gửi yêu cầu POST để đăng nhập
  Future<Map<String, dynamic>> login(String email, String password) async {
    final url = Uri.parse("$readDeviceUrl/login");
    final headers = {"Content-Type": "application/json"};
    final body = jsonEncode({
      "email": email,
      "password": password,
    });

    try {
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
  Future<Map<String, dynamic>> signup(UserModel user,String password) async {
    final url = Uri.parse("$baseUrl/signup");
    final headers = {
      "Content-Type": "application/x-www-form-urlencoded",
    };

    final body = {
      'email': user.email,
      'username': user.username,
      'password': password,
      'created_at': user.createdAt,  // Bạn có thể điền các giá trị này nếu cần
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
}
