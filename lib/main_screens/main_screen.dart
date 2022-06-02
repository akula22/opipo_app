import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedTab = 0;

  void onSelectTab(int index) {
    if (_selectedTab == index) return;
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Image.network('https://opipo.ru/images/logo3.png')),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        onTap: onSelectTab,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.calculate_rounded), label: 'Калькулятор'),
          BottomNavigationBarItem(
              icon: Icon(Icons.sticky_note_2_rounded), label: 'Наклейки'),
          BottomNavigationBarItem(
              icon: Icon(Icons.design_services), label: 'Дизайн'),
          // BottomNavigationBarItem(
          //     icon: Icon(Icons.branding_watermark), label: 'Браслеты'),
        ],
      ),
    );
  }
}
