import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intern/Screens/home_page.dart';

class ProviderClass with ChangeNotifier {
  void splashscreenn(BuildContext context) {
    Timer(Duration(seconds: 2), () {
      Navigator.pushReplacement(context, MaterialPageRoute(
        builder: (context) {
          return Homepage();
        },
      ));
    });
  }
}
