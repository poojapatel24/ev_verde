import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomLoadingWidget extends StatelessWidget{
  final double width;
  final double height;
 // final ShapeBorder shapeBorder;

  const CustomLoadingWidget.rectangular({
    this.width = double.infinity,
    required this.height
    //this.shapeBorder = const RoundedRectangleBorder()
  }); 

  const CustomLoadingWidget.circular({
    this.width = double.infinity,
    required this.height
    //this.shapeBorder = const CircleBorder()
  });
  @override
  Widget build(BuildContext context)   => Shimmer.fromColors(
    baseColor: Colors.grey[400]!,
    highlightColor: Colors.grey[300]!,
    period: Duration(seconds: 2),
    child: Container(
      width: width,
      height: height,
      decoration: ShapeDecoration(
        color: Colors.grey[400]!,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    ),
  );


}


