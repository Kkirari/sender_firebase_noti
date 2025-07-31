import 'package:flutter/material.dart';
import 'package:sender_firebase_noti/CreateProject/presentation/createproject.dart';
import 'package:sender_firebase_noti/Home/presentation/home.dart';
import 'package:sender_firebase_noti/Navigation/Widgets/buttonappbar.dart';
import 'package:sender_firebase_noti/Navigation/Widgets/customfab.dart';
import 'package:sender_firebase_noti/Profile/Presentation/profile.screen.dart';

class CustomBottomNavBarApp extends StatefulWidget {
  const CustomBottomNavBarApp({super.key});

  @override
  State<CustomBottomNavBarApp> createState() => _CustomBottomNavBarAppState();
}

class _CustomBottomNavBarAppState extends State<CustomBottomNavBarApp> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    Center(child: Text('Search')),
    CreateScreen(),
    Center(child: Text('History')),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() => _selectedIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      floatingActionButton: CustomFAB(onPressed: () => _onItemTapped(2)),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: ButtomAppBar(
        selectIndex: _selectedIndex,
        onItemTapped: _onItemTapped,
      ),
    );
  }
}
