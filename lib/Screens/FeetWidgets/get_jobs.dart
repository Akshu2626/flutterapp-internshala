import 'package:flutter/material.dart';
import 'package:intern/ApiStuff/my_api.dart';
import 'package:intern/Component/my_box2.dart';

class GetJobsPage extends StatefulWidget {
  final String token;
  const GetJobsPage({super.key, required this.token});

  @override
  State<GetJobsPage> createState() => _GetJobsPageState();
}

class _GetJobsPageState extends State<GetJobsPage> {
  MyApiClass myApiClass = MyApiClass();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Get all jobs'),
      ),
      body: FutureBuilder(
        future: myApiClass.GetAllJobs(),
        builder: (context, snapshot) {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${snapshot.data.length} Total Internships',
                    style: TextStyle(fontSize: 17, color: Colors.grey),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: Divider(thickness: 1, color: Colors.grey),
              ),
              Container(
                height: 600,
                child: ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, index) {
                    return MyBox2(
                      title: snapshot.data[index]['title'].toString(),
                      skill: snapshot.data[index]['skill'].toString(),
                      assesment: snapshot.data[index]['assesments'].toString(),
                      id: snapshot.data[index]['_id'].toString(),
                      opening: snapshot.data[index]['openings'].toString(),
                      perks: snapshot.data[index]['perks'].toString(),
                      prefrence: snapshot.data[index]['preferences'].toString(),
                      salary: snapshot.data[index]['salary'].toString(),
                      chartDate: snapshot.data[index]['createdAt'].toString(),
                      description:
                          snapshot.data[index]['description'].toString(),
                      jobtype: snapshot.data[index]['jobtype'].toString(),
                      onPressed: () {
                        myApiClass.GetApplayJob(
                            jobid: snapshot.data[index]['_id'].toString(),
                            token: widget.token);
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Apply Successfully')));
                      },
                    );
                  },
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
