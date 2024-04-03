import 'package:flutter/material.dart';
import 'package:intern/Employee/add_intern.dart';
import 'package:intern/Employee/add_job.dart';

class ShowActivityPage extends StatefulWidget {
  final String id;
  final String token;
  const ShowActivityPage({
    super.key,
    required this.id,
    required this.token,
  });

  @override
  State<ShowActivityPage> createState() => _ShowActivityPageState();
}

class _ShowActivityPageState extends State<ShowActivityPage>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(controller: _tabController, tabs: [
          Tab(text: 'Internships'),
          Tab(text: 'Jobs'),
        ]),
      ),
      body: TabBarView(controller: _tabController, children: [
        AddInternship(token: widget.token, id: widget.id),
        AddJobPage(token: widget.token, id: widget.id)
      ]),
    );
  }
}
