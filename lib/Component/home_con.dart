import 'package:flutter/material.dart';

class Homecontiner extends StatelessWidget {
  const Homecontiner({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: 270,
        height: 240,
        decoration: BoxDecoration(
            color: Colors.grey, borderRadius: BorderRadius.circular(13)),
      ),
    );
  }
}
