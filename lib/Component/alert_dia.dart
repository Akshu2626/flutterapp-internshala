import 'package:flutter/material.dart';

void dekho(BuildContext context) {
  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('Alert'),
        content: Text('Oops... some thing went wrong'),
      );
    },
  );
}
