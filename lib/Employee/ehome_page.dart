import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intern/ApiStuff/my_eployee.dart';
import 'package:http/http.dart' as http;
import 'package:intern/Component/rag_field.dart';
import 'package:intern/Employee/show_activity.dart';

class EmpHomepage extends StatefulWidget {
  final String token;
  final String id;
  const EmpHomepage({super.key, required this.token, required this.id});

  @override
  State<EmpHomepage> createState() => _EmpHomepageState();
}

class _EmpHomepageState extends State<EmpHomepage>
    with SingleTickerProviderStateMixin {
  final TextEditingController profileController = TextEditingController();
  final TextEditingController skillController = TextEditingController();
  final TextEditingController internshiptypeController =
      TextEditingController();
  final TextEditingController openingController = TextEditingController();
  final TextEditingController fromController = TextEditingController();
  final TextEditingController toController = TextEditingController();
  final TextEditingController durationController = TextEditingController();
  final TextEditingController responsiblityController = TextEditingController();
  final TextEditingController perkController = TextEditingController();
  final TextEditingController assemController = TextEditingController();
  final TextEditingController stipendController = TextEditingController();
  final TextEditingController descController = TextEditingController();

  MyEmployeeApi myEmployeeApi = MyEmployeeApi();
  var picker = ImagePicker();
  File? filePath;

  Future<void> empCiculerImage(
      {required String token, required String id}) async {
    final XFile? imagepath =
        await picker.pickImage(source: ImageSource.gallery);
    if (imagepath != null) {
      filePath = File(imagepath.path);
    } else {
      print('no file choosen');
    }

    var url =
        Uri.parse('https://internsala-vn0w.onrender.com/employe/avatar/$id');
    var request = http.MultipartRequest('POST', url);
    request.headers['Authorization'] = "Bearer $token";
    request.files.add(
        await http.MultipartFile.fromPath('organizationlogo', filePath!.path));
    var response = await request.send();
    // print(response.statusCode);
    if (response.statusCode == 200) {
      print('File uploaded');
      setState(() {});
    } else {
      print('no upload');
    }
  }

  @override
  Widget build(BuildContext context) {
    void clearr() {
      profileController.clear();
      skillController.clear();
      internshiptypeController.clear();
      fromController.clear();
      toController.clear();
      responsiblityController.clear();
      perkController.clear();
      assemController.clear();
      openingController.clear();
      durationController.clear();
      stipendController.clear();
      descController.clear();
    }

    void CreateJob() {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Create Job'),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  Mytextfield(
                      labell: 'Title',
                      hintText: 'enter Title name',
                      controller: profileController),
                  Mytextfield(
                      labell: 'Skill',
                      hintText: 'enter your skills',
                      controller: skillController),
                  Mytextfield(
                      labell: 'opening',
                      hintText: 'enter your opening',
                      controller: openingController),
                  Mytextfield(
                      labell: 'preferences',
                      hintText: 'Enter preference here',
                      controller: responsiblityController),
                  Mytextfield(
                      labell: 'Salary',
                      hintText: 'Enter salary',
                      controller: stipendController),
                  Mytextfield(
                      labell: 'perks',
                      hintText: 'Enter perks',
                      controller: perkController),
                  Mytextfield(
                      labell: 'assesments',
                      hintText: 'Enter assesments',
                      controller: assemController),
                  Mytextfield(
                      labell: 'jobtype',
                      hintText: 'Enter jobtype',
                      controller: internshiptypeController),
                  TextField(
                    maxLines: 3,
                    maxLength: 60,
                    controller: descController,
                    decoration: InputDecoration(
                        hintText: 'Enter Desciption here ...',
                        border: OutlineInputBorder()),
                  )
                ],
              ),
            ),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancel')),
              ElevatedButton(
                  onPressed: () {
                    myEmployeeApi.CreteJobhere(
                        context: context,
                        token: widget.token,
                        title: profileController.text,
                        skill: skillController.text,
                        jobtype: internshiptypeController.text,
                        opening: openingController.text,
                        descption: descController.text,
                        preference: responsiblityController.text,
                        salary: stipendController.text,
                        perks: perkController.text,
                        asses: assemController.text);
                    clearr();
                  },
                  child: Text('Create Job'))
            ],
          );
        },
      );
    }

    void CreateInternship() {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Create Internship'),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  Mytextfield(
                      labell: 'Profile',
                      hintText: 'enter profile name',
                      controller: profileController),
                  Mytextfield(
                      labell: 'Skill',
                      hintText: 'enter your skills',
                      controller: skillController),
                  Mytextfield(
                      labell: 'Intership-Type',
                      hintText: 'Enter Internship type',
                      controller: internshiptypeController),
                  Mytextfield(
                      labell: 'Stipend',
                      hintText: 'Enter stipend amount',
                      controller: stipendController),
                  Mytextfield(
                      labell: 'Openings',
                      hintText: 'Enter how many opening your have',
                      controller: openingController),
                  Mytextfield(
                      labell: 'From',
                      hintText: 'enter intership from',
                      controller: fromController),
                  Mytextfield(
                      labell: 'To',
                      hintText: 'enter intership to',
                      controller: toController),
                  Mytextfield(
                      labell: 'Duration',
                      hintText: 'Enter Inter Duration',
                      controller: durationController),
                  Mytextfield(
                      labell: 'responsibilty',
                      hintText: 'Enter responsibilty',
                      controller: responsiblityController),
                  Mytextfield(
                      labell: 'perks',
                      hintText: 'Enter perks here',
                      controller: perkController),
                  Mytextfield(
                      labell: 'Assesment',
                      hintText: 'Enter Assesment here',
                      controller: assemController),
                ],
              ),
            ),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancel')),
              ElevatedButton(
                  onPressed: () {
                    myEmployeeApi.CreateInternship(
                        token: widget.token,
                        profile: profileController.text,
                        skill: skillController.text,
                        intershiptype: internshiptypeController.text,
                        from: fromController.text,
                        to: toController.text,
                        responsibility: responsiblityController.text,
                        perks: perkController.text,
                        assesments: assemController.text,
                        openings: openingController.text,
                        duration: durationController.text,
                        context: context,
                        stipend: stipendController.text);
                    clearr();
                  },
                  child: Text('Create'))
            ],
          );
        },
      );
    }

    return Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Employe Homepage'),
              IconButton(
                  onPressed: () {
                    myEmployeeApi.GetEmpLogout(
                        token: widget.token, context: context);
                  },
                  icon: Icon(Icons.logout))
            ],
          ),
        ),
        body: FutureBuilder(
          future: myEmployeeApi.getEmpCurrentData(
              token: widget.token, context: context),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              // DateTime dateTime =
              //     DateTime.parse(snapshot.data['createdAt'].toString());
              String time = snapshot.data['employe']['createdAt'].toString();
              DateTime dateTime = DateTime.parse(time);

              int day = dateTime.day;
              int month = dateTime.month;
              int year = dateTime.year;
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello 👋,' +
                            snapshot.data['employe']['firstname'].toString(),
                        style: TextStyle(fontSize: 22),
                      ),
                      SizedBox(height: 30),
                      CircleAvatar(
                        radius: 80,
                        backgroundImage: NetworkImage(snapshot.data['employe']
                                ['organizationlogo']['url']
                            .toString()),
                        child: Align(
                          alignment: Alignment.bottomRight,
                          child: IconButton(
                              onPressed: () {
                                empCiculerImage(
                                    token: widget.token, id: widget.id);
                              },
                              icon: Icon(
                                Icons.edit,
                                size: 60,
                              )),
                        ),
                      ),
                      SizedBox(height: 20),
                      Text(
                        snapshot.data['employe']['email'].toString(),
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue),
                      ),
                      Text('joined data $day/$month/$year'),
                      Container(
                        height: 50,
                        child: Row(
                          children: [
                            Expanded(
                                child: Container(
                              child: ElevatedButton(
                                  onPressed: () {
                                    CreateInternship();
                                  },
                                  child: Text('Create Internship')),
                            )),
                            Expanded(
                                child: Container(
                              child: ElevatedButton(
                                  onPressed: () {
                                    CreateJob();
                                  },
                                  child: Text('Create Job')),
                            )),
                          ],
                        ),
                      ),
                      Container(
                        height: 200,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(
                                    'https://media.istockphoto.com/id/1346227626/photo/cheerful-medical-students-taking-selfie-and-having-fun-at-the-university.webp?b=1&s=170667a&w=0&k=20&c=h6qF1Ap2GONqOyZ5zQC7iFfP7V9tuBC5bGBwEt_q31I='))),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: TextButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) {
                                  return ShowActivityPage(
                                    token: widget.token,
                                    id: widget.id,
                                  );
                                },
                              ));
                            },
                            child: Text(
                              'show Acctivity\'s',
                              style: TextStyle(
                                  fontSize: 19,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold),
                            )),
                      ),
                    ],
                  ),
                ),
              );
            }
          },
        ));
  }

  @override
  void dispose() {
    profileController.dispose();
    skillController.dispose();
    internshiptypeController.dispose();
    fromController.dispose();
    toController.dispose();
    responsiblityController.dispose();
    perkController.dispose();
    assemController.dispose();
    openingController.dispose();
    stipendController.dispose();
    super.dispose();
  }
}
