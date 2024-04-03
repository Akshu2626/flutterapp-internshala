import 'package:flutter/material.dart';
import 'package:intern/ApiStuff/my_eployee.dart';
import 'package:intern/Component/my_drawer.dart';
import 'package:intern/Component/rag_field.dart';

class EmpRegisterPage extends StatelessWidget {
  const EmpRegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    MyEmployeeApi myEmployeeApi = MyEmployeeApi();

    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController firstController = TextEditingController();
    TextEditingController lastController = TextEditingController();
    TextEditingController contactController = TextEditingController();
    TextEditingController oragnisController = TextEditingController();
    TextEditingController orgdesController = TextEditingController();

    void clearFiled() {
      firstController.clear();
      lastController.clear();
      emailController.clear();
      passwordController.clear();
      contactController.clear();
      oragnisController.clear();
      orgdesController.clear();
    }

    return Scaffold(
      drawer: Drawer(
        child: MyDrawer(),
      ),
      appBar: AppBar(
        title: Text('employe Register page'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(Icons.person, size: 70),
              SizedBox(height: 30),
              Mytextfield(
                  controller: emailController,
                  hintText: 'john@example.com',
                  labell: 'Email ID'),
              Mytextfield(
                controller: passwordController,
                hintText: 'Minimum 6 characters',
                labell: 'Password',
              ),
              SizedBox(
                height: 100,
                child: Row(
                  children: [
                    Expanded(
                        child: Mytextfield(
                            controller: firstController,
                            hintText: 'John',
                            labell: 'First Name')),
                    SizedBox(width: 10),
                    Expanded(
                      child: Mytextfield(
                        controller: lastController,
                        hintText: 'Doe',
                        labell: 'Last name',
                      ),
                    ),
                  ],
                ),
              ),
              const Row(
                children: [
                  Text(
                    'By signing up, you agree to our ',
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    'Terms and Conditions',
                    style: TextStyle(fontSize: 12, color: Colors.blue),
                  )
                ],
              ),
              Mytextfield(
                  labell: 'contact',
                  hintText: 'Enter 10 number',
                  controller: contactController),
              Mytextfield(
                  labell: 'Organization',
                  hintText: 'enter organization name',
                  controller: oragnisController),
              SizedBox(height: 10),
              TextField(
                controller: orgdesController,
                maxLines: 3,
                decoration: InputDecoration(
                  hintMaxLines: 2,
                  label: Text('Enter Oraganization Descrition'),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    myEmployeeApi.getEmpSignUp(
                        fname: firstController.text,
                        lname: lastController.text,
                        contact: contactController.text,
                        email: emailController.text,
                        password: passwordController.text,
                        orgname: oragnisController.text,
                        context: context,
                        orgDes: orgdesController.text);
                    clearFiled();
                  },
                  child: Text('Employee Signup'))
            ],
          ),
        ),
      ),
    );
  }
}
