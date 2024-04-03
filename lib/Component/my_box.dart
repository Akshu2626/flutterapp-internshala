import 'package:flutter/material.dart';
import 'package:intern/Component/get_row.dart';

class MyBox extends StatelessWidget {
  final String id;
  final String profile;
  final String skills;
  final String interntype;
  final String opening;
  final String from;
  final String to;
  final String duration;
  final String responsibilty;
  final String perks;
  final String assesments;
  final String createdate;
  final void Function()? onPressed;

  const MyBox({
    super.key,
    required this.id,
    required this.profile,
    required this.skills,
    required this.interntype,
    required this.opening,
    required this.from,
    required this.to,
    required this.duration,
    required this.responsibilty,
    required this.perks,
    required this.assesments,
    required this.createdate,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      child: Container(
        color: Colors.grey[100],
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RawChip(label: Text('Actively hiring')),
              Text(
                profile,
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              GetRowData(iconns: Icons.person, texxt: 'skills : $skills'),
              GetRowData(
                  iconns: Icons.join_full,
                  texxt: 'Internship type : $interntype'),
              GetRowData(
                  iconns: Icons.open_in_browser_outlined,
                  texxt: 'Opening : $opening'),
              GetRowData(iconns: Icons.date_range, texxt: 'From : $from'),
              GetRowData(iconns: Icons.date_range, texxt: 'To : $to'),
              GetRowData(
                  iconns: Icons.timer_rounded, texxt: 'Duration : $duration'),
              GetRowData(
                  iconns: Icons.rate_review,
                  texxt: 'Responsibilty : $responsibilty'),
              GetRowData(
                  iconns: Icons.fastfood_outlined, texxt: 'Perks : $perks'),
              GetRowData(
                  iconns: Icons.first_page, texxt: 'Assesments : $assesments'),
              OutlinedButton(onPressed: onPressed, child: Text('Apply now'))
            ],
          ),
        ),
      ),
    );
  }
}
