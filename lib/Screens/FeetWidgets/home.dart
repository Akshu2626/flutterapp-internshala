// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intern/Screens/feedd_page.dart';
import 'package:intern/Screens/personal_details.dart';

class Myhomee extends StatelessWidget {
  final String name;
  final String id;
  final String token;
  final String fname;
  final String lname;
  final String email;
  const Myhomee(
      {super.key,
      required this.name,
      required this.id,
      required this.token,
      required this.fname,
      required this.lname,
      required this.email});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi, $name 👋',
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const Text('Let\'s help you land your dream career'),
            const SizedBox(height: 20),
            const Text(
              'To go list (1)',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return PresonalDetailsPage(
                      id: id,
                      token: token,
                      fname: fname,
                      lname: lname,
                      email: email,
                    );
                  },
                ));
              },
              child: Container(
                alignment: Alignment.center,
                height: 70,
                decoration: BoxDecoration(
                    color: Colors.grey[100],
                    borderRadius: BorderRadius.circular(13)),
                child: Container(
                  width: double.infinity,
                  child: const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'details missing',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, color: Colors.blue),
                        ),
                        Text(
                          'Add your personal details',
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Text(
                'Tranding on Internshala 🔥',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              height: 250,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 300,
                      height: 250,
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(12)),
                    ),
                  );
                },
              ),
            ),
            const Text(
              'Recommended for you',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Row(
              children: [
                Text('as per your'),
                Text(
                  'preferences',
                  style: TextStyle(color: Colors.blue),
                )
              ],
            ),
            Container(
              height: 350,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return jobcard(context: context,token: token);
                },
              ),
            ),
            const Text(
              'popular guarantee courses',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Container(
              height: 400,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) {
                  return courseCard(context: context,token: token);
                },
              ),
            ),
            const SizedBox(height: 40)
          ],
        ),
      ),
    );
  }
}
