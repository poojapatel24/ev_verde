import 'package:ev_verde/components/my_listitem.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReservationPage extends StatefulWidget{
  const ReservationPage({super.key});

  @override
  State<StatefulWidget> createState() => _ReservationPage();

}
class _ReservationPage extends State<ReservationPage>{
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: MyListItem(listText: 'History',prefixIcon: Icons.history,suffixIcon: Icons.navigate_next,),
      ),
    );
  }

}