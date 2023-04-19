import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyRoundContainer extends StatelessWidget {
  String mytext;
  Color? color;
  Color? textcolor;
  Function()? onPressedFunction = () {};
  double? height;
  double? width;

  MyRoundContainer(
      {required this.color,
      required this.mytext,
      required this.textcolor,
      this.onPressedFunction,
      this.height,
      this.width,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: color,
      ),
      child: Align(
        alignment: Alignment.center,
        child: InkWell(
          onTap: onPressedFunction,
          child: Text(
            mytext,
            style: TextStyle(
              color: textcolor,
              fontFamily: 'Questrial',
            ),
          ),
        ),
      ),
    );
  }
}
