import 'package:flutter/material.dart';
import 'package:private_property_management/App%20Screen/DashBoardScreen/DashBoardScreen.dart';
import 'package:private_property_management/App%20Screen/Proprties/PropertiesScreen.dart';
import 'package:private_property_management/App%20Screen/Settings/SettingsScreen.dart';
import 'package:private_property_management/App%20Screen/Tanents/TanentsScreen.dart';
import 'package:private_property_management/Widgest/BottomNavBar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  // Screens list for navigation
  final List<Widget> screens = [
    const DashboardScreen(),
    const Propertiesscreen(),
    TenantsScreen(),
    const Settingsscreen(),
  ];

  void onNavTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex], // Display the selected screen
      bottomNavigationBar: CustomBottomNavBar(
        currentIndex: currentIndex,
        onTap: onNavTap,
      ),
    );
  }
}
