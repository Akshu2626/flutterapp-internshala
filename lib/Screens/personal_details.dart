import 'package:flutter/material.dart';
import 'package:intern/ApiStuff/my_api.dart';
import 'package:intern/Component/rag_field.dart';

class PresonalDetailsPage extends StatefulWidget {
  final String token;
  final String id;
  final String fname;
  final String lname;
  final String email;
  const PresonalDetailsPage(
      {super.key,
      required this.token,
      required this.id,
      required this.fname,
      required this.lname,
      required this.email});

  @override
  State<PresonalDetailsPage> createState() => _PresonalDetailsPageState();
}

class _PresonalDetailsPageState extends State<PresonalDetailsPage> {
  MyApiClass myApiClass = MyApiClass();
  @override
  Widget build(BuildContext context) {
    TextEditingController fnameController =
        TextEditingController(text: widget.fname);
    TextEditingController lnameController =
        TextEditingController(text: widget.lname);
    TextEditingController emailController =
        TextEditingController(text: widget.email);
    TextEditingController contactController = TextEditingController();
    TextEditingController cityController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Personal details '),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Text(
                  'Personal details',
                  style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: 100,
                child: Row(
                  children: [
                    Expanded(
                        child: Mytextfield(
                            controller: fnameController,
                            hintText: 'John',
                            labell: 'First Name')),
                    SizedBox(width: 10),
                    Expanded(
                      child: Mytextfield(
                        controller: lnameController,
                        hintText: 'Doe',
                        labell: 'Last name',
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Row(
                  children: [
                    Text(
                      'Profile picture',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 10),
                    Text(
                      '(Recommended)',
                      style: TextStyle(fontSize: 17, color: Colors.grey),
                    )
                  ],
                ),
              ),
              Container(
                height: 80,
                color: Colors.blue[100],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.upload),
                    SizedBox(width: 15),
                    Text(
                      'Upload picture',
                      style: TextStyle(color: Colors.blue, fontSize: 18),
                    ),
                  ],
                ),
              ),
              Container(
                height: 70,
                child: Text(
                  'Upload a professional picture of yourself (Max file size: 1Mb and max resolution: 500px X 500px. File type - jpeg, jpg, png, gif)',
                  style: TextStyle(fontSize: 15),
                ),
              ),
              Mytextfield(
                  labell: 'Email',
                  hintText: 'enter email',
                  controller: emailController),
              Mytextfield(
                  labell: 'Contact number',
                  hintText: 'Enter your name',
                  controller: contactController),
              Mytextfield(
                  labell: 'Current City',
                  hintText: 'Enter your city',
                  controller: cityController),
              Text('Gender'),
              Container(
                height: 80,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    RawChip(
                      label: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Female'),
                      ),
                      avatar: CircleAvatar(
                        radius: 20,
                      ),
                    ),
                    RawChip(
                      label: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Male'),
                      ),
                      avatar: CircleAvatar(),
                    ),
                    RawChip(
                      label: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('Others'),
                      ),
                      avatar: CircleAvatar(),
                    ),
                  ],
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    print(widget.id);
                    myApiClass.userUpdate(
                      context: context,
                        fname: fnameController.text,
                        lname: lnameController.text,
                        email: emailController.text,
                        number: contactController.text,
                        city: cityController.text,
                        id: widget.id,
                        token: widget.token);
                  },
                  child: Text('Update'))
            ],
          ),
        ),
      ),
    );
  }
}
