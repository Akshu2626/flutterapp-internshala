import 'package:flutter/material.dart';
import 'package:intern/Component/home_drawer.dart';
import 'package:intern/Employee/ereg_page.dart';
import 'package:intern/Employee/login_page.dart';
import 'package:intern/Screens/login_page.dart';
import 'package:intern/Screens/ragister_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DrawerHeader(
            child: Container(
              height: 50,
              color: Colors.grey[100],
            ),
          ),
          HomeDrawer(
            texxt: 'Register',
            iconss: Icons.person_add_alt_1,
            abcd: RegisterPage(),
          ),
          HomeDrawer(
            texxt: 'Login',
            iconss: Icons.person_add_rounded,
            abcd: LoginPage(),
          ),
          HomeDrawer(
              texxt: 'Employe Register page',
              iconss: Icons.person_add_alt_1,
              abcd: EmpRegisterPage()),
          HomeDrawer(
              texxt: 'Employe Login',
              iconss: Icons.login,
              abcd: EmpLoginPage()),
          Divider(thickness: 2),
          Text('EXPLORE'),
          HomeDrawer(
            texxt: 'Internships',
            iconss: Icons.airplanemode_on,
            abcd: Container(),
          ),
          HomeDrawer(
            texxt: 'Jobs',
            iconss: Icons.shopping_bag,
            abcd: Container(),
          ),
          HomeDrawer(
            texxt: 'Courses',
            iconss: Icons.video_collection_rounded,
            abcd: Container(),
          ),
          HomeDrawer(
            texxt: 'Placement',
            iconss: Icons.accessibility_new_rounded,
            abcd: Container(),
          ),
          Text('Help & Support'),
          HomeDrawer(
            texxt: 'Help Center',
            iconss: Icons.info,
            abcd: Container(),
          ),
          HomeDrawer(
            texxt: 'Report a complaint',
            iconss: Icons.info_outlined,
            abcd: Container(),
          ),
          HomeDrawer(
            texxt: 'More',
            iconss: Icons.add_box_outlined,
            abcd: Container(),
          ),
          SizedBox(height: 50)
        ],
      ),
    );
  }
}
