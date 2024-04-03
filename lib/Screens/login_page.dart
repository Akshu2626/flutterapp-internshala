import 'package:flutter/material.dart';
import 'package:intern/Component/my_Drawer.dart';
import 'package:intern/Component/rag_field.dart';
import 'package:intern/ApiStuff/my_api.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController userController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  MyApiClass myApiClass = MyApiClass();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      drawer: const Drawer(
        child: MyDrawer(),
      ),
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
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
                controller: userController,
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
                  myApiClass.getLoginData(
                      context: context,
                      femail: userController.text,
                      fpassword: passwordController.text);
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
    );
  }
}
