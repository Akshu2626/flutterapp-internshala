import 'package:flutter/material.dart';

class MyBottomBar extends StatefulWidget {
  final int currentIndex;
  final Function(int)? onTap;
  final String token;
  const MyBottomBar({super.key, required this.token,required this.onTap,required  this.currentIndex});

  @override
  State<MyBottomBar> createState() => _MyBottomBarState();
}

class _MyBottomBarState extends State<MyBottomBar> {
  
  @override
  Widget build(BuildContext context) {
    

    return BottomNavigationBar(
        currentIndex: widget.currentIndex,
        onTap: widget.onTap,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.airplanemode_on_rounded), label: 'Internships'),
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag_outlined), label: 'Jobs'),
          BottomNavigationBarItem(
              icon: Icon(Icons.person_4_sharp), label: 'Clubs'),
          BottomNavigationBarItem(icon: Icon(Icons.tv), label: 'Courses'),
        ]);
  }
}
