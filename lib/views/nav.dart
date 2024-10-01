import 'package:flutter/material.dart';
import 'package:weather_api/views/forecast_view.dart';
import 'package:weather_api/views/weather_view.dart';

class CustomBottomNavBar extends StatefulWidget {
  @override
  _CustomBottomNavBarState createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends State<CustomBottomNavBar>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  late AnimationController _animationController;
  late Animation<double> _animation;

  // Define the two pages you want to switch between
  final List<Widget> _pages = [
    WeatherView(), // First page
    ForecastView(), // Second page
  ];

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300), // Animation duration
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut, // Animation curve
    );
  }

  @override
  void dispose() {
    _animationController.dispose(); // Clean up animation controller
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex], // Show the selected page
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            _animationController.forward(from: 0); // Trigger animation
          });
        },
        type: BottomNavigationBarType.fixed, // Ensures the icons are evenly spaced
        backgroundColor: Colors.black, // Change this to your preferred color
        selectedItemColor: Colors.yellow, // Color for the selected icon
        unselectedItemColor: Colors.white, // Color for unselected icons
        showSelectedLabels: false, // Hide the labels for a cleaner look
        showUnselectedLabels: false, // Hide labels for unselected icons as well
        items: [
          BottomNavigationBarItem(
            icon: AnimatedIconWidget(
              animation: _animation,
              icon: Icons.map,
              isSelected: _currentIndex == 0,
            ), // Animated Icon for First tab
            label: '',
          ),
          BottomNavigationBarItem(
            icon: AnimatedIconWidget(
              animation: _animation,
              icon: Icons.menu,
              isSelected: _currentIndex == 1,
            ), // Animated Icon for Second tab
            label: '',
          ),
        ],
      ),
    );
  }
}

class AnimatedIconWidget extends StatelessWidget {
  final Animation<double> animation;
  final IconData icon;
  final bool isSelected;

  const AnimatedIconWidget({
    Key? key,
    required this.animation,
    required this.icon,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: isSelected ? 1.2 : 1.0, // Scale selected icon
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      child: AnimatedOpacity(
        opacity: isSelected ? 1.0 : 0.7, // Fade effect
        duration: Duration(milliseconds: 300),
        child: Icon(icon, color: isSelected ? Colors.yellow : Colors.white),
      ),
    );
  }
}
