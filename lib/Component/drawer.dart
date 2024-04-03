import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intern/ApiStuff/my_api.dart';
import 'package:intern/Component/home_drawer.dart';
import 'package:intern/Screens/FeetWidgets/club.dart';
import 'package:intern/Screens/FeetWidgets/course.dart';
import 'package:intern/Screens/FeetWidgets/get_internship.dart';
import 'package:intern/Screens/FeetWidgets/get_jobs.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:intern/Screens/forget_Pass.dart';

class MyDrawer2 extends StatefulWidget {
  final String cirimg;
  final String token;
  final String id;
  const MyDrawer2(
      {super.key, required this.cirimg, required this.token, required this.id});

  @override
  State<MyDrawer2> createState() => _MyDrawer2State();
}

class _MyDrawer2State extends State<MyDrawer2> {
  var picker = ImagePicker();
  File? _filepath;

  Future<void> getImagePicker(
      {required String token, required String id, required String img}) async {
    final XFile? pickedImage =
        await picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      _filepath = File(pickedImage.path);
      print('file choosen');
    } else {
      print('no file taken');
    }

    // Assuming widget.id is the user's ID
    var url =
        Uri.parse('https://internsala-vn0w.onrender.com/student/avatar/$id');

    var request = http.MultipartRequest('POST', url);
    request.headers['Authorization'] = "Bearer $token";
    request.files
        .add(await http.MultipartFile.fromPath('avatar', _filepath!.path));

    var response = await request.send();
    if (response.statusCode == 200) {
      print('Image uploaded successfully');
      setState(() {});
    } else {
      print('Failed to upload image');
    }
  }

  @override
  Widget build(BuildContext context) {
    MyApiClass myApiClass = MyApiClass();
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            DrawerHeader(
                child: CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(widget.cirimg),
              child: Align(
                alignment: Alignment.bottomRight,
                child: IconButton(
                    onPressed: () {
                      getImagePicker(
                          token: widget.token,
                          id: widget.id,
                          img: widget.cirimg);
                    },
                    icon: Icon(
                      Icons.edit,
                      color: Colors.blue,
                    )),
              ),
            )),
            Container(
              height: 400,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HomeDrawer(
                        texxt: 'Internships',
                        iconss: Icons.airplanemode_active_rounded,
                        abcd: GetAllInternships(token: widget.token)),
                    HomeDrawer(
                        texxt: 'Jobs',
                        iconss: Icons.card_travel_rounded,
                        abcd: GetJobsPage(token: widget.token)),
                    HomeDrawer(
                        texxt: 'Clubs', iconss: Icons.person, abcd: ClubPage()),
                    HomeDrawer(
                        texxt: 'Courses',
                        iconss: Icons.tv,
                        abcd: CoursesPage()),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(context, MaterialPageRoute(
                            builder: (context) {
                              return ResetPassword(
                                id: widget.id,
                                token: widget.token,
                              );
                            },
                          ));
                        },
                        child: Row(
                          children: [
                            Icon(Icons.lock_reset),
                            SizedBox(
                              width: 10,
                            ),
                            Text('reset Password')
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 20),
                      child: GestureDetector(
                        onTap: () {
                          myApiClass.getSignOut(
                              token: widget.token, context: context);
                        },
                        child: Row(
                          children: [
                            Icon(Icons.logout),
                            SizedBox(
                              width: 10,
                            ),
                            Text('Sign out')
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
