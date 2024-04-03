import 'package:flutter/material.dart';
import 'package:intern/Component/bottom_nav.dart';
import 'package:intern/Screens/FeetWidgets/club.dart';
import 'package:intern/Screens/FeetWidgets/course.dart';
import 'package:intern/Screens/FeetWidgets/get_internship.dart';
import 'package:intern/Screens/FeetWidgets/get_jobs.dart';
import 'package:intern/Screens/feedd_page.dart';

class MyGharPage extends StatefulWidget {
  final String token;
  const MyGharPage({super.key, required this.token});

  @override
  State<MyGharPage> createState() => _MyGharPageState();
}

class _MyGharPageState extends State<MyGharPage> {
  var currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    void selecteddPage(int index) {
      setState(() {
        currentIndex = index;
      });
    }

    List pages = [
      FeedPage(token: widget.token),
      GetAllInternships(token: widget.token),
      GetJobsPage(token: widget.token),
      ClubPage(),
      CoursesPage()
    ];

    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: MyBottomBar(
        currentIndex: currentIndex,
        token: widget.token,
        onTap: (val) {
          selecteddPage(val);
        },
      ),
    );
  }
}
