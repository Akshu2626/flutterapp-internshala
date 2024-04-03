import 'package:flutter/material.dart';
import 'package:intern/ApiStuff/my_eployee.dart';
import 'package:intern/Employee/job_details.dart';

class AddJobPage extends StatefulWidget {
  final String token;
  final String id;
  const AddJobPage({
    super.key,
    required this.token,
    required this.id,
  });

  @override
  State<AddJobPage> createState() => _AddJobPageState();
}

class _AddJobPageState extends State<AddJobPage> {
  MyEmployeeApi myEmployeeApi = MyEmployeeApi();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: myEmployeeApi.ReadJobs(token: widget.token),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.data['jobs'].length == 0) {
            return Center(child: Text('no job created yet'));
          } else {
            return ListView.builder(
              itemCount: snapshot.data['jobs'].length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: GestureDetector(
                    onTap: () {
                      print(index);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return JobDetailsPage(
                              token: widget.token,
                              idx: snapshot.data['jobs'][index]['_id']
                                  .toString(),
                            );
                          },
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.blue[200],
                          borderRadius: BorderRadius.circular(13)),
                      child: ListTile(
                        title: Text(
                            snapshot.data['jobs'][index]['title'].toString()),
                        subtitle: Text(
                            snapshot.data['jobs'][index]['skill'].toString()),
                      ),
                    ),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
