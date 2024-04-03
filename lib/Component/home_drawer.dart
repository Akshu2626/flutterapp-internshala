import 'package:flutter/material.dart';

class HomeDrawer extends StatelessWidget {
  final Widget abcd;
  final String texxt;
  final IconData iconss;
  const HomeDrawer(
      {super.key,
      required this.texxt,
      required this.iconss,
      required this.abcd});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (context) {
              return abcd;
            },
          ));
        },
        child: Row(
          children: [
            Icon(
              iconss,
              size: 20,
            ),
            SizedBox(width: 15),
            Text(
              texxt,
              style: TextStyle(fontSize: 16),
            )
          ],
        ),
      ),
    );
  }
}
