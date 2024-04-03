import 'package:flutter/material.dart';

class DetCom extends StatelessWidget {
  final String text;
  final String dd;
  final IconData iconn;
  const DetCom(
      {super.key, required this.text, required this.dd, required this.iconn});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Icon(iconn),
          SizedBox(
            width: 20,
          ),
          Text(
            text,
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(width: 20),
          Text(
            "$dd ",
            style: TextStyle(fontSize: 19),
          )
        ],
      ),
    );
  }
}
