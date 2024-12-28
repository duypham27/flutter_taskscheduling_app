import 'package:flutter/material.dart';
import 'package:flutter_taskscheduling_app/screens/profilepage.dart';
import 'package:flutter_taskscheduling_app/screens/qrcode.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomeContent(),
    const QRCodePage(),
    const ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("PSP, MEX, PSM"),
        backgroundColor: Colors.redAccent,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_active),
          ),
        ],
      ),
      body: IndexedStack(
        index: _selectedIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Trang chủ",
          ),
          BottomNavigationBarItem(
            icon: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.redAccent,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.qr_code_scanner,
                color: Colors.white,
                size: 30,
              ),
            ),
            label: "QR Code", // Đảm bảo cung cấp label ở đây
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Tài khoản",
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.redAccent,
        onTap: _onItemTapped,
      ),
    );
  }


}

// Widget trang chính ban đầu
class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Nội dung trang chính (giống mã ban đầu)
        ],
      ),
    );
  }
}
