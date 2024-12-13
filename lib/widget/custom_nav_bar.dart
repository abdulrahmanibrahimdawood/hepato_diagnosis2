import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hepato/constant.dart';
import 'package:hepato/pages/analysis_page.dart';
import 'package:hepato/pages/doctors_page.dart';
import 'package:hepato/pages/home_page.dart';
import 'package:hepato/pages/questions_page.dart';

class CustomNavBar extends StatefulWidget {
  const CustomNavBar({super.key});

  @override
  State<CustomNavBar> createState() => _MainPageState();
}

class _MainPageState extends State<CustomNavBar> {
  int _selectedIndex = 0;

  static const List<Widget> _pages = [
    HomePage(),
    AnalysisPage(),
    QuesthionsPage(),
    DoctorsPage(),
  ];

  static const List<BottomNavigationBarItem> _navigationItems = [
    BottomNavigationBarItem(
      icon: FaIcon(
        FontAwesomeIcons.houseChimney,
        size: 28,
      ),
      label: 'Home',
    ),
    BottomNavigationBarItem(
      icon: FaIcon(
        FontAwesomeIcons.magnifyingGlass,
        size: 28,
      ),
      label: 'Analysis',
    ),
    BottomNavigationBarItem(
      icon: FaIcon(
        FontAwesomeIcons.circleQuestion,
        size: 28,
      ),
      label: 'Questions',
    ),
    BottomNavigationBarItem(
      icon: FaIcon(
        FontAwesomeIcons.stethoscope,
        size: 28,
      ),
      label: 'Doctors',
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: IndexedStack(
          index: _selectedIndex,
          children: _pages,
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 1,
                blurRadius: 10,
              ),
            ],
          ),
          child: BottomNavigationBar(
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
            items: _navigationItems,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: kPrimaryColor,
            unselectedItemColor: Colors.grey,
            selectedFontSize: 12,
            unselectedFontSize: 12,
            elevation: 0,
            backgroundColor: Colors.white,
          ),
        ),
      ),
    );
  }
}
