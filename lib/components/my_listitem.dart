import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyListItem extends StatelessWidget {
  String listText;
  IconData? suffixIcon;
  IconData? prefixIcon;
  Function()? onPressedFunction = () {};
  Color? color;
  MyListItem({
    super.key,
    required this.listText,
    this.prefixIcon,
    this.suffixIcon,
    this.onPressedFunction,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: InkWell(
        onTap: onPressedFunction,
        child: Container(
            padding: EdgeInsets.all(5),
            height: 60,
            width: double.infinity,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.transparent,
                border: Border.all(color: Colors.grey)
                // color: myColor,
                ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: color,
                  ),
                  child: Icon(
                    prefixIcon,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
                Text(
                  listText,
                  style: const TextStyle(
                      color: Colors.black45,
                      fontSize: 15,
                      fontFamily: 'Questrial',
                      fontWeight: FontWeight.w700),
                ),
                Container(
                  //color: Colors.greenAccent,
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Colors.grey.shade300,
                  ),
                  child: Icon(
                    suffixIcon,
                    color: Colors.black,
                    size: 30,
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
