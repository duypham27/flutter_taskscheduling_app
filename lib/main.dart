import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:flutter_taskscheduling_app/screens/HomePage/homepage.dart';
import 'package:flutter_taskscheduling_app/screens/HomePage/createurgentevents.dart';
import 'package:flutter_taskscheduling_app/screens/ProfilePage/profilepage.dart';
import 'screens/qrcode.dart';
import 'package:flutter_taskscheduling_app/screens/LoginPage/login.dart';
import 'package:flutter_taskscheduling_app/screens/LoginPage/signup.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp( // Sử dụng GetMaterialApp thay vì MaterialApp
      debugShowCheckedModeBanner: false,
      title: 'Abstergo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/login', // Đặt trang khởi động là /login
      getPages: [
        GetPage(name: '/login', page: () => const Login()),
        GetPage(name: '/signup', page: () => const RegistrationPage()),
        GetPage(name: '/home', page: () => const MainNavigation()),
        GetPage(name: '/qrcode', page: () => const QRCodePage()),
        GetPage(name: '/profile', page: () => const ProfilePage()),
      ],
    );
  }
}

class MainNavigation extends StatefulWidget {
  const MainNavigation({super.key});

  @override
  _MainNavigationState createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
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
    // Xác định tên trang cho các AppBar
    String appBarTitle = '';
    if (_selectedIndex == 0) {
      appBarTitle = 'Trang chủ';
    } else if (_selectedIndex == 1) {
      appBarTitle = 'QR Code';
    } else if (_selectedIndex == 2) {
      appBarTitle = 'Tài khoản';
    }

    return Scaffold(
      appBar: AppBar(
        title: _selectedIndex == 0
            ? Image.asset(
          'assets/images/abstergo_banner.png',
          height: 40,
          fit: BoxFit.contain,
        )
            : Text(appBarTitle), // Hiển thị tên trang cho các trang còn lại
        backgroundColor: Colors.white,
        actions: _selectedIndex == 0
            ? [
          OutlinedButton.icon(
            onPressed: () {
            },
            icon: const Icon(Icons.add, color: Colors.blue),
            label: const Text(
              "Kế hoạch",
              style: TextStyle(color: Colors.blue),
            ),
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Colors.blue), // Màu viền nút
            ),
          ),
          const SizedBox(width: 8), // Khoảng cách giữa các nút
          OutlinedButton.icon(
            onPressed: () {
              Get.to(() => CreateUrgentEvents());
            },
            icon: const Icon(Icons.add, color: Colors.red),
            label: const Text(
              "Mối nguy",
              style: TextStyle(color: Colors.red),
            ),
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Colors.red), // Màu viền nút
            ),
          ),
        ]
            : null, // Không có actions ở các trang khác
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
            label: "QR Code",
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


