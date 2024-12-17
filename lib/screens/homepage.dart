import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("PSP, MEX, PSM"),
        backgroundColor: Colors.redAccent,
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.notifications_active),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Report Header
            Container(
              padding: EdgeInsets.all(16.0),
              color: Colors.red[50],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "BÁO CÁO",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.red,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Tháng 12 / 2024",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black54,
                    ),
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _infoCard("Đã hoàn thành/Tổng CV", "10 / 49", "20%"),
                      _infoCard("Đã xử lý / Tổng mối nguy", "2 / 25", "8%"),
                    ],
                  ),
                  SizedBox(height: 16),
                  _riskProgress(),
                ],
              ),
            ),
            Divider(),
            // Plan Section
            Container(
              padding: EdgeInsets.all(16.0),
              alignment: Alignment.centerLeft,
              child: Text(
                "KẾ HOẠCH",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
            ),
            _planItem(
              "KH tuần tra",
              "11/12/2024",
              "Người tuần tra: Chưa rõ",
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Trang chủ",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.qr_code_scanner),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Tài khoản",
          ),
        ],
        selectedItemColor: Colors.redAccent,
      ),
    );
  }

  // Widget tạo thông tin thẻ nhỏ
  Widget _infoCard(String title, String value, String percentage) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 8.0),
        padding: EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.redAccent),
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 4,
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 12,
                color: Colors.black54,
              ),
            ),
            SizedBox(height: 4),
            Text(
              value,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 4),
            Text(
              percentage,
              style: TextStyle(
                fontSize: 14,
                color: Colors.redAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget biểu đồ tiến độ xử lý mối nguy
  Widget _riskProgress() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _progressBox("A", "1/19", "5%", Colors.red),
        _progressBox("B", "1/5", "20%", Colors.yellow),
        _progressBox("C", "0/1", "0%", Colors.blue),
      ],
    );
  }

  // Widget khối xử lý mối nguy
  Widget _progressBox(String label, String value, String percentage, Color color) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(8.0),
          decoration: BoxDecoration(
            color: color.withOpacity(0.2),
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: Text(
            label,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: color,
              fontSize: 16,
            ),
          ),
        ),
        SizedBox(height: 4),
        Text(
          value,
          style: TextStyle(fontSize: 12, color: Colors.black87),
        ),
        Text(
          percentage,
          style: TextStyle(
            fontSize: 12,
            color: color,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  // Widget cho mỗi mục kế hoạch
  Widget _planItem(String title, String date, String subtext) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      elevation: 2,
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text("$date\n$subtext"),
        trailing: Icon(Icons.cancel, color: Colors.redAccent),
      ),
    );
  }
}
