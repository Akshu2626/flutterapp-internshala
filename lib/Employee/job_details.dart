import 'package:flutter/material.dart';
import 'package:intern/ApiStuff/my_eployee.dart';
import 'package:intern/Component/det_com.dart';

class JobDetailsPage extends StatefulWidget {
  final String idx;
  final String token;
  const JobDetailsPage({
    super.key,
    required this.idx,
    required this.token,
  });

  @override
  State<JobDetailsPage> createState() => _JobDetailsPageState();
}

class _JobDetailsPageState extends State<JobDetailsPage> {
  MyEmployeeApi myEmployeeApi = MyEmployeeApi();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Details Page'),
        ),
        body: FutureBuilder(
          future:
              myEmployeeApi.GetJobDetails(id: widget.idx, token: widget.token),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else {
              List<String> removee(String abc) {
                var a = abc.split(',');

                return a;
              }

              List _data = removee(snapshot.data['job']['skill'].toString());

              String time = snapshot.data['job']['createdAt'].toString();
              DateTime dateTime = DateTime.parse(time);

              int day = dateTime.day;
              int month = dateTime.month;
              int year = dateTime.year;

              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        snapshot.data['job']['title'].toString(),
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: Text('Profile insights',
                            style: TextStyle(fontSize: 20)),
                      ),
                      Container(
                        height: 70,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: _data.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5),
                              child: Chip(label: Text(_data[index].toString())),
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Text(
                          'Job Details',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ),
                      DetCom(
                          text: 'Post Date',
                          dd: '$day/$month/$year',
                          iconn: Icons.access_time),
                      DetCom(
                          iconn: Icons.currency_rupee_sharp,
                          text: 'Pay',
                          dd: snapshot.data['job']['salary'].toString()),
                      DetCom(
                          iconn: Icons.construction_rounded,
                          text: 'Job Type',
                          dd: snapshot.data['job']['jobtype'].toString()),
                      DetCom(
                          iconn: Icons.construction_rounded,
                          text: 'Openings',
                          dd: snapshot.data['job']['openings'].toString()),
                      DetCom(
                          iconn: Icons.construction_rounded,
                          text: 'Preferences',
                          dd: snapshot.data['job']['preferences'].toString()),
                      DetCom(
                          iconn: Icons.construction_rounded,
                          text: 'Salary',
                          dd: snapshot.data['job']['salary'].toString()),
                      DetCom(
                          iconn: Icons.construction_rounded,
                          text: 'Perks',
                          dd: snapshot.data['job']['perks'].toString()),
                      DetCom(
                          iconn: Icons.construction_rounded,
                          text: 'Assesments',
                          dd: snapshot.data['job']['assesments'].toString()),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        child: Text(
                          'job Description',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Container(
                          width: double.infinity,
                          height: 400,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Text(
                              snapshot.data['job']['description'].toString(),
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 300,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                              'https://images.unsplash.com/photo-1598257006626-48b0c252070d?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8am9ifGVufDB8fDB8fHww'),
                        ),
                      )
                    ],
                  ),
                ),
              );
            }
          },
        ));
  }
}
