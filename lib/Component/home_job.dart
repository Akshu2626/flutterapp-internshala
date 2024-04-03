import 'package:flutter/material.dart';

class HomeJobs extends StatelessWidget {
  const HomeJobs({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 370,
        width: 280,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(13)),
        child: const Padding(
          padding: EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Chip(label: Text('Actively hiring')),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Operations',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                  ),
                  Text('Internshala Trainings')
                ],
              ),
              Divider(
                thickness: 2,
              ),
              Row(
                children: [Icon(Icons.location_on), Text('Gurgaon')],
              ),
              Row(
                children: [Icon(Icons.currency_pound), Text('18,000 /month')],
              ),
              Row(
                children: [Icon(Icons.location_on), Text('Gurgaon')],
              ),
              Row(
                children: [
                  Text('View details'),
                  Icon(Icons.arrow_forward_ios_outlined)
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
