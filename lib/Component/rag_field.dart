import 'package:flutter/material.dart';

class Mytextfield extends StatelessWidget {
  final String labell;
  final String hintText;
  final TextEditingController controller;
  const Mytextfield(
      {super.key,
      required this.labell,
      required this.hintText,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labell,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
        ),
        TextField(
          controller: controller,
          decoration: InputDecoration(
              hintText: hintText,
              border:
                  OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12))),
        )
      ],
    );
  }
}
