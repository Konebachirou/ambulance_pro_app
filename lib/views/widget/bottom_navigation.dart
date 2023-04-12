import 'package:flutter/material.dart';
import 'package:bottom_bar/bottom_bar.dart';

import '../mission/mission_view.dart';
import '../mission/test.dart';
import '../setting/setting_view.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  @override
  int _currentPage = 0;
  Widget? body;

  Widget _pagechooser(int pageindex) {
    switch (pageindex) {
      case 0:
        return Acceuil();
      case 1:
        return SettingView();
      default:
        return Acceuil();
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: body ?? Acceuil(),
      bottomNavigationBar: BottomBar(
        backgroundColor: Colors.white,
        selectedIndex: _currentPage,
        onTap: (int index) {
          setState(() {
            _currentPage = index;
            body = _pagechooser(index);
          });
        },
        itemPadding: EdgeInsets.symmetric(
            vertical: 10, horizontal: MediaQuery.of(context).size.width * 0.12),
        items: <BottomBarItem>[
          BottomBarItem(
            icon: const Icon(
              Icons.medical_services_rounded,
              size: 28,
            ),
            title: const Text('Missions'),
            activeColor: Colors.blue.shade900,
          ),
          BottomBarItem(
            icon: const Icon(Icons.settings),
            title: const Text('paramètre'),
            activeColor: Colors.blue.shade900,
          ),
        ],
      ),
    );
  }
}
