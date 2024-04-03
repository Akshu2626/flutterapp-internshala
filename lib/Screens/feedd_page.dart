import 'package:flutter/material.dart';
import 'package:intern/ApiStuff/my_api.dart';
import 'package:intern/Component/drawer.dart';
import 'package:intern/Screens/FeetWidgets/get_internship.dart';
import 'package:intern/Screens/FeetWidgets/get_jobs.dart';
import 'package:intern/Screens/FeetWidgets/home.dart';

class FeedPage extends StatefulWidget {
  final String token;
  const FeedPage({super.key, required this.token});

  @override
  State<FeedPage> createState() => _FeedPageState();
}

class _FeedPageState extends State<FeedPage> {
  MyApiClass myApiClass = MyApiClass();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future:
            myApiClass.getCurrentHome(token: widget.token, context: context),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            return homeData(
                id: snapshot.data['student']['_id'].toString(),
                token: widget.token,
                img: snapshot.data['student']['avatar']['url'].toString(),
                name: snapshot.data['student']['firstname'].toString(),
                lname: snapshot.data['student']['lastname'].toString(),
                email: snapshot.data['student']['email'].toString());
          }
        },
      ),
    );
  }
}

Widget homeData(
    {required String name,
    required String lname,
    required String email,
    required String img,
    required String token,
    required String id}) {
  return Scaffold(
    appBar: AppBar(),
    drawer: Drawer(
      child: MyDrawer2(cirimg: img, token: token, id: id),
    ),
    body: Myhomee(
      id: id,
      name: name,
      token: token,
      fname: name,
      lname: lname,
      email: email,
    ),
  );
}

Widget jobcard({required context,required String token}) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Container(
      width: 300,
      height: 350,
      decoration: BoxDecoration(
        color: Colors.green[100],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Chip(label: Text('Actively hiring')),
            Text(
              'Senior Protocol Enginner',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 19),
            ),
            Text('Gateway Bhopal'),
            Divider(
              thickness: 2,
              color: Colors.grey,
            ),
            Row(
              children: [
                Icon(Icons.location_on),
                Text('Work From Home'),
              ],
            ),
            Row(
              children: [
                Icon(Icons.attach_money_outlined),
                Text('30,00,000'),
              ],
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return GetJobsPage(token: token);
                  },
                ));
              },
              child: Text(
                'View details',
                style: TextStyle(fontSize: 22, color: Colors.blue),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget courseCard({required context,required String token}) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Container(
      width: 300,
      height: 400,
      color: Colors.green[100],
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 150,
            color: Colors.red,
          ),
          Text('Full Stack Development'),
          Row(
            children: [
              Icon(Icons.watch_later_outlined),
              Text('8 months course')
            ],
          ),
          Row(
            children: [
              Icon(Icons.currency_rupee),
              Text('Confirmed 4LPA salary')
            ],
          ),
          Row(
            children: [
              Icon(Icons.shopping_bag_outlined),
              Text('1.08 Lac+ Opportunities')
            ],
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return GetAllInternships(token: token);
                },
              ));
            },
            child: Text(
              'Know more',
              style: TextStyle(
                  fontSize: 19,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(height: 30)
        ],
      ),
    ),
  );
}
