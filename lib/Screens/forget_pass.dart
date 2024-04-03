import 'package:flutter/material.dart';
import 'package:intern/ApiStuff/my_api.dart';
import 'package:intern/Component/rag_field.dart';

class ResetPassword extends StatelessWidget {
  final String token;
  final String id;
  const ResetPassword({
    super.key,
    required this.token,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController resetPasswordController = TextEditingController();
    MyApiClass myApiClass = MyApiClass();

    void getLogin() {
      myApiClass.ResetPassword(
          context: context,
          token: token,
          id: id,
          pass: resetPasswordController.text);
      resetPasswordController.clear();
    }

    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Reset password"),
          Mytextfield(
              labell: 'Enter your new Password',
              hintText: 'new password',
              controller: resetPasswordController),
          ElevatedButton(
              onPressed: () {
                getLogin();
              },
              child: Text('Reset password'))
        ],
      ),
    );
  }
}
