import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:rahmasalsabilah_19552011184/pages/dashboard.dart';
import 'package:rahmasalsabilah_19552011184/pages/date_page.dart';
import 'package:rahmasalsabilah_19552011184/pages/time_page.dart';

// ignore: camel_case_types
class mainPage extends StatefulWidget {
  const mainPage({Key? key}) : super(key: key);

  @override
  _mainPageState createState() => _mainPageState();
}

// ignore: camel_case_types
class _mainPageState extends State<mainPage> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          children: const [
            Dashboard(),
            datePage(),
            timePage(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _selectedIndex,
        onItemSelected: (index) {
          setState(() {
            _selectedIndex = index;
          });
          _pageController.jumpToPage(index);
        },
        items: [
          BottomNavyBarItem(
            icon: const Icon(Icons.dashboard),
            title: const Text('Dashboard'),
            activeColor: Colors.blueAccent,
            inactiveColor: Colors.blueAccent,
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.date_range),
            title: const Text('Date'),
            activeColor: Colors.redAccent,
            inactiveColor: Colors.redAccent,
          ),
          BottomNavyBarItem(
            icon: const Icon(Icons.timer),
            title: const Text('Time'),
            activeColor: Colors.greenAccent,
            inactiveColor: Colors.greenAccent,
          ),
        ],
      ),
    );
  }
}
