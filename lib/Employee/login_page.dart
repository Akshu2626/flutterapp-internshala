import 'package:flutter/material.dart';
import 'package:intern/ApiStuff/my_eployee.dart';
import 'package:intern/Component/my_drawer.dart';
import 'package:intern/Component/rag_field.dart';

class EmpLoginPage extends StatelessWidget {
  const EmpLoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    MyEmployeeApi myEmployeeApi = MyEmployeeApi();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    void clear() {
      emailController.clear();
      passwordController.clear();
    }

    return Scaffold(
      drawer: Drawer(
        child: MyDrawer(),
      ),
      appBar: AppBar(title: Text('Employer Login page')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text(
                'Login',
                style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Container(
                  alignment: Alignment.center,
                  decoration:
                      BoxDecoration(border: Border.all(color: Colors.black)),
                  height: 50,
                  child: const Text('Sign up with Google'),
                ),
              ),
              const Divider(thickness: 2),
              Mytextfield(
                  controller: emailController,
                  labell: 'Email ID',
                  hintText: 'john@example.com'),
              const SizedBox(height: 20),
              Mytextfield(
                  controller: passwordController,
                  labell: 'Password',
                  hintText: 'Minimum 6 characters'),
              GestureDetector(
                onTap: () {
                  print("object");
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('Forgot password ?',
                        style: TextStyle(color: Colors.blue))
                  ],
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    myEmployeeApi.getEmpSignIn(
                        context: context,
                        email: emailController.text,
                        password: passwordController.text);
                    clear();
                  },
                  child: Text('click')),
              //
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Not registered?'),
                  Text(
                    'Sign up',
                    style: TextStyle(color: Colors.blue),
                  ),
                  SizedBox(height: 100)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
