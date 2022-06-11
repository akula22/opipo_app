import 'package:flutter/material.dart';
import 'package:opipo_app/user/user_list.dart';
import 'package:opipo_app/user/user_widget.dart';

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
      appBar: AppBar(
        // title: Image.network('https://opipo.ru/images/logo3.png'),
        title: Image.asset("images/logo3.png"),
      ),
      body: IndexedStack(
        index: _selectedTab,
        children: [
          Text('Index 0: 1'),
          UserListWidget(),
          UserWidget(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        onTap: onSelectTab,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.calculate_rounded), label: 'Заказы'),
          BottomNavigationBarItem(
              icon: Icon(Icons.supervised_user_circle), label: 'Пользователи'),
          BottomNavigationBarItem(
              icon: Icon(Icons.design_services), label: 'Дизайн'),
          // BottomNavigationBarItem(
          //     icon: Icon(Icons.branding_watermark), label: 'Браслеты'),
        ],
      ),
    );
  }
}
