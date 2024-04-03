import 'package:flutter/material.dart';
import 'package:intern/ApiStuff/my_api.dart';
import 'package:intern/Component/my_box.dart';

class GetAllInternships extends StatelessWidget {
  final String token;
  const GetAllInternships({super.key, required this.token});

  @override
  Widget build(BuildContext context) {
    MyApiClass myApiClass = MyApiClass();

    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        title: Text('Get all Internships'),
      ),
      body: FutureBuilder(
        future: myApiClass.GetAllInternships(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '${snapshot.data.length} Total Internships',
                      style: TextStyle(fontSize: 17, color: Colors.grey),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Divider(thickness: 1, color: Colors.grey),
                ),
                Container(
                  height: 550,
                  child: ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return MyBox(
                        profile: snapshot.data[index]['profile'].toString(),
                        skills: snapshot.data[index]['skill'].toString(),
                        interntype:
                            snapshot.data[index]['internshiptype'].toString(),
                        opening: snapshot.data[index]['openings'].toString(),
                        from: snapshot.data[index]['from'].toString(),
                        to: snapshot.data[index]['to'].toString(),
                        duration: snapshot.data[index]['duration'].toString(),
                        responsibilty:
                            snapshot.data[index]['responsibility'].toString(),
                        perks: snapshot.data[index]['perks'].toString(),
                        assesments:
                            snapshot.data[index]['assesments'].toString(),
                        id: snapshot.data[index]['_id'].toString(),
                        createdate:
                            snapshot.data[index]['createdAt'].toString(),
                        onPressed: () {
                          myApiClass.GetApplayInternship(
                              jobid: snapshot.data[index]['_id'].toString(),
                              token: token);
                        },
                      );
                    },
                  ),
                )
              ],
            );
          }
        },
      ),
    );
  }
}
