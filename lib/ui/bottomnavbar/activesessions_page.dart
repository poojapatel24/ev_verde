import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ActiveSessionsPage extends StatefulWidget{
  const ActiveSessionsPage({super.key});

  @override
  State<StatefulWidget> createState() => _ActiveSessionsPage();
}
class _ActiveSessionsPage extends State<ActiveSessionsPage>{
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Active Sessions Page'),
      ),
    );
  }

}