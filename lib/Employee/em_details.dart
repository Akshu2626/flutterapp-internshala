import 'package:flutter/material.dart';
import 'package:intern/ApiStuff/my_eployee.dart';
import 'package:intern/Component/det_com.dart';

class InterDeatilsPage extends StatefulWidget {
  final String idx;
  final String token;
  const InterDeatilsPage({super.key, required this.idx, required this.token});

  @override
  State<InterDeatilsPage> createState() => _InterDeatilsPageState();
}

class _InterDeatilsPageState extends State<InterDeatilsPage> {
  MyEmployeeApi myEmployeeApi = MyEmployeeApi();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details page'),
      ),
      body: FutureBuilder(
        future:
            myEmployeeApi.GetInternDetails(id: widget.idx, token: widget.token),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else {
            List<String> removee(String abc) {
              var a = abc.split(',');

              return a;
            }

            List _data =
                removee(snapshot.data['internship']['skill'].toString());
            String time = snapshot.data['internship']['createdAt'].toString();
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
                      snapshot.data['internship']['profile'].toString(),
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
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
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            child: Chip(label: Text(_data[index].toString())),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 12),
                      child: Text(
                        'Internship Details',
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
                        dd: '8000'),
                    DetCom(
                        iconn: Icons.construction_rounded,
                        text: 'Internship Type',
                        dd: snapshot.data['internship']['internshiptype']
                            .toString()),
                    DetCom(
                        text: 'Openings',
                        dd: snapshot.data['internship']['openings'].toString(),
                        iconn: Icons.folder_open_sharp),
                    DetCom(
                        text: 'From',
                        dd: snapshot.data['internship']['from'],
                        iconn: Icons.date_range),
                    DetCom(
                        text: 'To',
                        dd: snapshot.data['internship']['to'],
                        iconn: Icons.date_range),
                    DetCom(
                        text: 'Duration',
                        dd: snapshot.data['internship']['duration'],
                        iconn: Icons.timer),
                    DetCom(
                        text: 'Responsibilty',
                        dd: snapshot.data['internship']['responsibility'],
                        iconn: Icons.timer),
                    DetCom(
                        text: 'Perks',
                        dd: snapshot.data['internship']['perks'],
                        iconn: Icons.card_giftcard),
                    DetCom(
                        text: 'Assesments',
                        dd: snapshot.data['internship']['assesments'],
                        iconn: Icons.card_giftcard),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
