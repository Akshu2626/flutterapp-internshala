import 'package:flutter/material.dart';
import 'package:intern/ApiStuff/my_eployee.dart';
import 'package:intern/Employee/em_details.dart';

class AddInternship extends StatefulWidget {
  final String token;
  final String id;
  const AddInternship({
    super.key,
    required this.token,
    required this.id,
  });

  @override
  State<AddInternship> createState() => _AddInternshipState();
}

class _AddInternshipState extends State<AddInternship> {
  MyEmployeeApi myEmployeeApi = MyEmployeeApi();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: myEmployeeApi.ReadIntership(token: widget.token),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            return snapshot.data['internships'].length == 0
                ? Center(child: Text('Internship not created yet'))
                : ListView.builder(
                    itemCount: snapshot.data['internships'].length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: GestureDetector(
                          onTap: () {
                            // myEmployeeApi.GetInternDetails(
                            //     id: snapshot.data['internships'][index]['_id'],
                            //     token: widget.token);
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return InterDeatilsPage(
                                    token: widget.token,
                                    idx: snapshot.data['internships'][index]
                                            ['_id']
                                        .toString());
                              },
                            ));
                            print('object');
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                color: Colors.blue[100],
                                borderRadius: BorderRadius.circular(13)),
                            child: ListTile(
                              title: Text(
                                snapshot.data['internships'][index]['profile']
                                    .toString(),
                                style: TextStyle(
                                    wordSpacing: 5,
                                    fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                snapshot.data['internships'][index]['skill']
                                    .toString(),
                                style: TextStyle(fontSize: 15),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  );
          }
        },
      ),
      //
    );
  }
}
