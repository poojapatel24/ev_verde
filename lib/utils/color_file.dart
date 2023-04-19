
import 'dart:ui';

import 'package:flutter/cupertino.dart';

class ColorFile{
  final primaryColor = const Color(0xff6b9dfc);
  final secondaryColor = const Color(0xffa1c6fd);
  final tertiaryColor = const Color(0xff205cf1);
  final blackColor = const Color(0xff1a1d26);

  final greyColor = const Color(0xffd9dadb);

  final Shader shader = const LinearGradient(
    colors: <Color>[Color(0xffABCFF2), Color(0xff9AC6F3)],
  ).createShader(const Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  final linearGradientBlue = const LinearGradient(
      begin: Alignment.bottomRight,
      end: Alignment.topLeft,
      colors: [Color(0xff6b9dfc), Color(0xff205cf1)],
      stops: [0.0, 1.0]);
  final linearGradientPurple = const LinearGradient(
      begin: Alignment.bottomRight,
      end: Alignment.topLeft,
      //colors: [Color(0xff009E60), Color(0xff32CD32)],
      colors: [Color.fromARGB(200, 46, 139, 87),Color.fromARGB(200, 50, 205, 50)],
      stops: [0.0, 1.0]);
}//#009E60  #9FE2BF  #2E8B57 #4CBB17  #32CD32
//Color.fromARGB(225, 46, 139, 87)//rgb(46, 139, 87)