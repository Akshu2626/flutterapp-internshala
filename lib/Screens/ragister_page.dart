import 'package:flutter/material.dart';
import 'package:intern/ApiStuff/my_api.dart';
import 'package:intern/Component/my_Drawer.dart';
import 'package:intern/Component/rag_field.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    MyApiClass myApiClass = MyApiClass();
    TextEditingController userController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController firstController = TextEditingController();
    TextEditingController lastController = TextEditingController();

    void clearFiled() {
      userController.clear();
      passwordController.clear();
      firstController.clear();
      lastController.clear();
    }

    return Scaffold(
      drawer: const Drawer(
        child: MyDrawer(),
      ),
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Sign-up and apply for free',
              style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
            ),
            const Text('1,50,000+ companies hiring at internshala'),
            Container(
              alignment: Alignment.center,
              decoration:
                  BoxDecoration(border: Border.all(color: Colors.black)),
              height: 50,
              child: const Text('Sign up with Google'),
            ),
            const Divider(thickness: 2),
            Mytextfield(
                controller: userController,
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
            ElevatedButton(
              onPressed: () {
                myApiClass.getRagisterData(context: context,
                    femail: userController.text,
                    fpassword: passwordController.text,
                    fname: firstController.text,
                    lname: lastController.text);
                clearFiled();
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    backgroundColor: Colors.blue,
                    content: Text('Ragister Succesfully ')));
              },
              child: Text('Sign up'),
              style: ButtonStyle(),
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Already registered ?'),
                Text(
                  'Login',
                  style: TextStyle(color: Colors.blue),
                )
              ],
            ),
            const SizedBox(height: 50)
          ],
        ),
      ),
    );
  }
}
