import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController myController;
  bool isObscureText;
  String? myLabelText;
  String? myHintText;
  TextInputType myTextInputType;
  bool? wantEnabledBorder;
  bool? wantFocusedBorder;
  String? Function(String?)? myValidatorFunction;
  double? hintTextletterSpacing;
  double? inputTextletterSpacing;
  double? inputTextSize;
  int? maxInputLength;
  IconData? suffixIcon;
  IconData? prefixIcon;
  Function()? onPressedFunction = () {};
  MyTextField(
      {super.key,
      required this.myController,
      required this.isObscureText,
      this.myHintText,
      this.myLabelText,
      this.myTextInputType = TextInputType.emailAddress,
      this.wantEnabledBorder,
      this.wantFocusedBorder,
      this.myValidatorFunction,
      this.hintTextletterSpacing,
      this.inputTextletterSpacing,
      this.inputTextSize,
      this.maxInputLength,
      this.suffixIcon,
      this.prefixIcon,
      this.onPressedFunction});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: myValidatorFunction,
      keyboardType: myTextInputType,
      style: TextStyle(
        color: Colors.black,
        fontSize: inputTextSize,
        fontWeight: FontWeight.w400,
        letterSpacing: inputTextletterSpacing,
      ),
      // textAlign: TextAlign.center,
      controller: myController,
      obscureText: isObscureText,
      // obscuringCharacter: '*',
      cursorColor: Color(0xff32CD32),
      cursorRadius: const Radius.circular(10),
      maxLength: maxInputLength,
      // validate after each user interaction
      autovalidateMode: AutovalidateMode.onUserInteraction,
      // cursorHeight: 30,
      decoration: InputDecoration(
          counterText: "",
          hintText: myHintText,
         /* hintStyle: TextStyle(
              color: Colors.black54, letterSpacing: hintTextletterSpacing),*/
          labelText: myLabelText,
          labelStyle: const TextStyle(color:  Colors.black54),
          //suffix: IconButton(onPressed: onPressedFunction, icon: Icon(suffixIcon),),
          /*suffix:  GestureDetector(
            onTap: () {
              isObscureText = !isObscureText;
            },
            child:
            Icon(isObscureText ? Icons.visibility : Icons.visibility_off),
          ),*/
          prefix: Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Icon(
              prefixIcon,
              color: Colors.blueGrey,
            ),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          errorStyle: const TextStyle(
              color: Color.fromRGBO(242, 102, 62, 1),
              fontSize: 10,
              fontWeight: FontWeight.w500)),
    );
  }
}
