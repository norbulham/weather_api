import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:weather_api/views/forecast_view.dart';
import 'package:weather_api/views/weather_view.dart';

class PracticeBottomNavBar extends StatefulWidget {
  const PracticeBottomNavBar({super.key});

  @override
  State<PracticeBottomNavBar> createState() => _PracticeBottomNavBarState();
}

class _PracticeBottomNavBarState extends State<PracticeBottomNavBar> {
  int _currentIndex = 0;

  // List of views
  final List<Widget> _pages = [
    WeatherView(),
    ForecastView(),
    WeatherView(),  // Duplicate view, you can change this to another view
  ];

  // List of bottom navigation items
  final List<Icon> _navItems = [
    Icon(Icons.home, color: Colors.white),
    Icon(Icons.menu, color: Colors.white),
    Icon(Icons.search_sharp, color: Colors.white),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Color(0xff9ba9ff),
        color: Color(0xff613dc1).withOpacity(0.5),
        buttonBackgroundColor: Color(0xff7364d2).withOpacity(0.4),
        index: _currentIndex,
        height: 60.0,  // Ensure height is set
        items: _navItems,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        animationDuration: Duration(milliseconds: 300),
        animationCurve: Curves.easeInOut,
      ),
    );
  }
}
