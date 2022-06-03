import 'package:flutter/material.dart';
import 'package:opipo_app/user/user_widget.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedTab = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    Text('Index 0: 1'),
    UserListWidget(),
    Text('Index 3: 3'),
  ];

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
      body: Center(
        child: _widgetOptions[_selectedTab],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        onTap: onSelectTab,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.calculate_rounded), label: 'Калькулятор'),
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
