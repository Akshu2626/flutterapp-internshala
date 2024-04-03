import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intern/Component/alert_dia.dart';
import 'package:intern/Employee/ehome_page.dart';
import 'package:intern/Screens/home_page.dart';

class MyEmployeeApi {
  var Base_Url = 'https://internsala-vn0w.onrender.com';
  // '/employe/signup'

  Future getEmpSignUp({
    required String fname,
    required String lname,
    required String contact,
    required String email,
    required String password,
    required String orgname,
    required String orgDes,
    required context,
  }) async {
    var url = Uri.parse('$Base_Url/employe/signup');
    var response = await http.post(url, body: {
      "firstname": fname,
      "lastname": lname,
      "contact": contact,
      "email": email,
      "password": password,
      "organizationname": orgname,
      "organizationdescription": orgDes,
    });
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data);
    } else {
      dekho(context);
    }
  }

  Future getEmpSignIn(
      {required String email,
      required String password,
      required context}) async {
    var url = Uri.parse('$Base_Url/employe/signin');
    var reponse =
        await http.post(url, body: {"email": email, "password": password});
    if (reponse.statusCode == 200) {
      var data = jsonDecode(reponse.body);
      if (data['success']) {
        Navigator.pushReplacement(context, MaterialPageRoute(
          builder: (context) {
            return EmpHomepage(
              token: data['token'],
              id: data['id'],
            );
          },
        ));
      }
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

//employee current Data

  Future<dynamic> getEmpCurrentData(
      {required String token, required context}) async {
    var url = Uri.parse('$Base_Url/employe/current');
    var response =
        await http.post(url, headers: {'Authorization': 'Bearer $token'});
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data);
      return data;
    } else {
      print("no data");
    }
  }

//create Internship

  Future<dynamic> CreateInternship(
      {required String token,
      required String profile,
      required String skill,
      required String intershiptype,
      required String from,
      required String to,
      required String responsibility,
      required String perks,
      required String assesments,
      required String openings,
      required String duration,
      required context,
      required String stipend}) async {
    var url = Uri.parse('$Base_Url/employe/internship/create');
    var response = await http.post(url, headers: {
      'Authorization': 'Bearer $token'
    }, body: {
      'profile': profile,
      "skill": skill,
      'internshiptype': intershiptype,
      'openings': openings,
      "from": from,
      'to': to,
      'stipend': stipend,
      'duration': duration,
      'responsibility': responsibility,
      'perks': perks,
      'assesments': assesments,
    });
    print(response.body);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data);
    } else {
      Navigator.pop(context);
    }
  }

  Future<dynamic> CreteJobhere({
    required String token,
    required String title,
    required String skill,
    required String jobtype,
    required String opening,
    required String descption,
    required String preference,
    required String salary,
    required String perks,
    required String asses,
    required context,
  }) async {
    var url = Uri.parse('$Base_Url/employe/job/create');
    var response = await http.post(url, headers: {
      'Authorization': 'Bearer $token',
    }, body: {
      'title': title,
      'skill': skill,
      'jobtype': jobtype,
      'openings': opening,
      'description': descption,
      'preferences': preference,
      'salary': salary,
      'perks': perks,
      'assesments': asses
    });
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data;
    } else {
      Navigator.pop(context);
    }
  }

  Future<dynamic> ReadIntership({required String token}) async {
    var url = Uri.parse('$Base_Url/employe/internship/read');
    var response = await http.post(url, headers: {
      'Authorization': 'Bearer $token',
    });
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data);
      return data;
    } else {
      print('no data');
    }
  }

  Future<dynamic> GetInternDetails(
      {required String id, required String token}) async {
    var url = Uri.parse('$Base_Url/employe/internship/read/$id');
    var response = await http.post(url, headers: {
      'Authorization': 'Bearer $token',
    });
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data;
    } else {
      print('no data');
    }
  }

  Future<dynamic> ReadJobs({required String token}) async {
    var url = Uri.parse('$Base_Url/employe/job/read');
    var response = await http.post(url, headers: {
      'Authorization': 'Bearer $token',
    });
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      print(data);
      return data;
    } else {
      print('no data');
    }
  }

  Future<dynamic> GetJobDetails(
      {required String id, required String token}) async {
    var url = Uri.parse('$Base_Url/employe/job/read/$id');
    var response = await http.post(url, headers: {
      'Authorization': 'Bearer $token',
    });
    // print(response.body);
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return data;
    } else {
      print('no data');
    }
  }

//signout

  Future GetEmpLogout({required String token, required context}) async {
    var url = Uri.parse('$Base_Url/employe/signout');
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
        print('nhi huaa');
      }
    }
  }
}
