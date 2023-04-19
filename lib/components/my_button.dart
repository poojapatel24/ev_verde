import 'package:flutter/material.dart';

import '../utils/color_file.dart';

class MyButton extends StatelessWidget {
  Color myColor = const Color.fromRGBO(242, 102, 62, 1);
  final String buttonName;
  Function()? onPressedFunction = () {};
  MyButton(
      {super.key,
      required this.myColor,
      required this.buttonName,
      required this.onPressedFunction,
      TextInputType? textInputType});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: InkWell(
        onTap: onPressedFunction,
        child: Container(
          height: 50,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            //color: ColorFile().linearGradientBlue,
            gradient: ColorFile().linearGradientPurple,
            // color: myColor,
          ),
          child: Text(
            buttonName,
            style: const TextStyle(
                color: Colors.white, fontSize: 15, fontWeight: FontWeight.w700),
          ),
        ),
      ),
    );
  }
}
