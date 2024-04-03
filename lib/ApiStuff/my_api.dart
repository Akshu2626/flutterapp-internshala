import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intern/Component/alert_dia.dart';
import 'package:intern/Screens/feedd_page.dart';
import 'package:intern/Screens/ghar_page.dart';
import 'package:intern/Screens/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyApiClass {
  var baseUrl = 'https://internsala-vn0w.onrender.com';
  List daata = [];

  Future getRagisterData(
      {required String femail,
      required String fpassword,
      required String fname,
      required String lname,
      required context}) async {
    var url = Uri.parse('$baseUrl/student/signup');
    var response = await http.post(url, body: {
      'email': femail,
      'password': fpassword,
      'firstname': fname,
      'lastname': lname,
    });
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      // print(data);
    } else {
      dekho(context);
    }
  }

  Future<dynamic> getLoginData(
      {required String femail,
      required String fpassword,
      required context}) async {
    var url = Uri.parse('$baseUrl/student/signin');
    var response =
        await http.post(url, body: {'email': femail, 'password': fpassword});
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      if (data['success']) {
        Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) {
            return MyGharPage(token: data['token']);
          },
        ));
      }
      return data;
    } else {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Alert'),
            content: Text('Sorry, Wrong Creadential'),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('cancel'))
            ],
          );
        },
      );
    }
  }

  // getHomepage

  Future<dynamic> getCurrentHome(
      {required String token, required context}) async {
    var url = Uri.parse('$baseUrl/student/currentuser');
    var response =
        await http.post(url, headers: {'Authorization': 'Bearer $token'});
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      // print(data);
      daata.add(data);
      return data;
    } else {
      dekho(context);
    }
  }

//signOut
  Future getSignOut({required String token, required context}) async {
    var url = Uri.parse('$baseUrl/student/signout');
    var response =
        await http.get(url, headers: {"Authorization": 'Bearer $token'});
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      if (data['message'] == 'Successfully signout') {
        Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) {
            return Homepage();
          },
        ));
      } else {
        print('no data');
      }
    }
  }

  Future userUpdate(
      {required String id,
      required String token,
      required String fname,
      required String lname,
      required String email,
      required String number,
      required context,
      required String city}) async {
    var url = Uri.parse('$baseUrl/student/update/$id');
    var response = await http.post(url, headers: {
      'Authorization': "Bearer $token"
    }, body: {
      'firstname': fname,
      "lastname": lname,
      "email": email,
      "contact": number,
      "city": city
    });

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      // print(data);
    } else {
      print('no data');
    }
  }

// reset password

  Future ResetPassword(
      {required String token,
      required String id,
      required String pass,
      required context}) async {
    var url = Uri.parse(
        'https://internsala-vn0w.onrender.com/student/reset-password/$id');
    var response = await http.post(url,
        headers: {'Authorization': "Bearer $token"}, body: {"password": pass});
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      if (data['token']) {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return FeedPage(token: data['token']);
          },
        ));
      } else {
        print('no data');
      }
    }
  }

  Future<dynamic> GetAllJobs() async {
    var url = Uri.parse('$baseUrl/student/read/job');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data);
      return data;
    } else {
      print('no data');
    }
  }

  Future<dynamic> GetAllInternships() async {
    var url = Uri.parse('$baseUrl/student/read/internship');
    var response = await http.get(url);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);

      return data;
    } else {
      print('no data');
    }
  }

  Future GetApplayJob({required String jobid, required String token}) async {
    var url = Uri.parse('$baseUrl/student/apply/job/$jobid');
    var response = await http.post(url, headers: {
      'Authorization': "Bearer $token",
    });
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data);
    } else {
      print('no data');
    }
  }
  Future GetApplayInternship({required String jobid, required String token}) async {
    var url = Uri.parse('$baseUrl/student/apply/internship/$jobid');
    var response = await http.post(url, headers: {
      'Authorization': "Bearer $token",
    });
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data);
    } else {
      print('no data');
    }
  }
}
