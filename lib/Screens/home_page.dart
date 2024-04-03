import 'package:flutter/material.dart';
import 'package:intern/Component/home_con.dart';
import 'package:intern/Component/home_job.dart';
import 'package:intern/Component/my_Drawer.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> _badge = [
      'Big brands',
      'Work from home',
      'Part-time',
      'MBA',
      'Engineering',
      'Media',
      'Design',
      'Data Science'
    ];

    return Scaffold(
      drawer: Drawer(child: MyDrawer()
          //
          ),
//

      appBar: AppBar(
        title: Text('Internshala'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Search here...',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(14))),
              ),
              SizedBox(height: 25),
              // Container(
              //   height: 50,
              //   color: Colors.green[200],
              //   child: Row(
              //     children: [
              //       Expanded(child: Container()),
              //       Expanded(child: Container()),
              //     ],
              //   ),
              // ),

              //
              Text(
                'Make your dream career a reality',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 15),
              Text(
                'Trending on Internshala 🔥',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              ),
              SizedBox(height: 20),
              Container(
                  height: 230,
                  child: ListView.builder(
                    itemCount: 4,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Homecontiner();
                    },
                  )),
              Container(
                color: Colors.grey[100],
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20),
                    Text(
                      'Latest internships on internshala',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    Text('POPULAR CATEGORIES:'),
                    Container(
                      height: 70,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _badge.length,
                        itemBuilder: (context, index) {
                          return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: RawChip(label: Text(_badge[index])));
                        },
                      ),
                    ),
                    Container(
                      height: 370,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return HomeJobs();
                        },
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
