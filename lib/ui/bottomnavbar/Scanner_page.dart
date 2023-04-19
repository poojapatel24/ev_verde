import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScannerPage extends StatefulWidget{
  const ScannerPage({super.key});

  @override
  State<StatefulWidget> createState() => _ScannerPage();
}
class _ScannerPage extends State<ScannerPage>{
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Scanner Page'),
      ),
    );
  }

}