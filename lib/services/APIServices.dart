import 'dart:convert'; // Chuyển đổi JSON
import 'package:http/http.dart' as http; // Thư viện HTTP

class ApiService {
  static const String baseUrl = "http://localhost/API_Mobile";

  // Phương thức gửi yêu cầu POST để đăng nhập
  Future<Map<String, dynamic>> login(String email, String password) async {
    final url = Uri.parse("$baseUrl/login");
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
}
