import 'package:flutter/material.dart';
import 'package:intern/Component/get_row.dart';

class MyBox2 extends StatelessWidget {
  final String title;
  final String skill;
  final String jobtype;
  final String opening;
  final String prefrence;
  final String salary;
  final String perks;
  final String assesment;
  final String description;
  final String id;
  final String chartDate;
  final void Function()? onPressed;
  const MyBox2({
    super.key,
    required this.title,
    required this.skill,
    required this.jobtype,
    required this.opening,
    required this.prefrence,
    required this.salary,
    required this.perks,
    required this.assesment,
    required this.description,
    required this.id,
    required this.chartDate,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Colors.grey[100],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RawChip(label: Text('Actively hiring')),
            Text(
              title,
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            GetRowData(iconns: Icons.food_bank, texxt: 'Skills : $skill'),
            GetRowData(iconns: Icons.food_bank, texxt: 'Job type : $jobtype'),
            GetRowData(iconns: Icons.food_bank, texxt: 'openings : $opening'),
            GetRowData(
                iconns: Icons.food_bank, texxt: 'preferences : $prefrence'),
            GetRowData(iconns: Icons.food_bank, texxt: 'salary : $salary'),
            GetRowData(iconns: Icons.food_bank, texxt: 'perks : $perks'),
            GetRowData(
                iconns: Icons.food_bank, texxt: 'assesments : $assesment'),
            GetRowData(
                iconns: Icons.food_bank, texxt: 'description : $description'),
            OutlinedButton(onPressed: onPressed, child: Text('Apply now'))
          ],
        ),
      ),
    );
  }
}
