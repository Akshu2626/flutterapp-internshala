import 'package:flutter/material.dart';

class GetRowData extends StatelessWidget {
  final IconData iconns;
  final String texxt;
  const GetRowData({
    super.key,
    required this.iconns,
    required this.texxt,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Icon(iconns),
          SizedBox(width: 8),
          Text(texxt),
        ],
      ),
    );
  }
}
