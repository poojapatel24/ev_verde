import 'dart:convert';

import 'package:ev_verde/bloc/generate_otp_bloc.dart';
import 'package:ev_verde/bloc/signup_bloc.dart';
import 'package:ev_verde/model/otp/request_generate_otp.dart';
import 'package:ev_verde/model/signup/request_signup.dart';
import 'package:ev_verde/utils/constants.dart';
import 'package:ev_verde/utils/preference_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

import '../components/my_button.dart';
import '../components/my_textfield.dart';

class SignupView extends StatefulWidget {
  const SignupView({super.key});

  @override
  State<StatefulWidget> createState() => _SignupView();
}

class _SignupView extends State<SignupView> {
  final firstNameController = TextEditingController(text: 'Pooja');
  final lastNameController = TextEditingController(text: 'patel');
  final emailController =
      TextEditingController(text: 'pooja.patel@slscorp.com');
  final phoneController = TextEditingController(text: '8306683534');
  final passwordController = TextEditingController(text: '355Kunal\$');
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Padding(
        padding: const EdgeInsets.only(top: 10),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //Text field
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        MyTextField(
                          myController: firstNameController,
                          isObscureText: false,
                          myLabelText: 'First Name',
                          myHintText: 'Enter First Name',
                          myValidatorFunction:
                              Validators.required('First Name is required'),
                          prefixIcon: Icons.account_circle_outlined,
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        MyTextField(
                          myController: lastNameController,
                          isObscureText: false,
                          myLabelText: 'Last Name',
                          myHintText: 'Enter Last Name',
                          myValidatorFunction:
                              Validators.required('First Last is required'),
                          prefixIcon: Icons.account_circle_outlined,
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        MyTextField(
                          myController: emailController,
                          isObscureText: false,
                          myLabelText: 'Email',
                          myHintText: 'Enter Email id',
                          myValidatorFunction:
                              Validators.required('Email id is required'),
                          prefixIcon: Icons.alternate_email,
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        MyTextField(
                          myController: phoneController,
                          isObscureText: false,
                          myLabelText: 'Phone no',
                          myHintText: 'Enter Phone no',
                          myValidatorFunction: Validators.compose([
                            Validators.required('Phone no is required'),
                            Validators.minLength(
                                10, 'at least 10 digit required'),
                          ]),
                          myTextInputType: TextInputType.phone,
                          prefixIcon: Icons.phone_android_outlined,
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        MyTextField(
                          myController: passwordController,
                          isObscureText: true,
                          myLabelText: 'Password',
                          myHintText: 'Enter Password',
                          myValidatorFunction: Validators.compose([
                            Validators.required('Password is required'),
                            Validators.patternString(
                                r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
                                'Invalid Password')
                          ]),
                          prefixIcon: Icons.password,
                        ),
                        const SizedBox(
                          height: 25,
                        ),

                        //signin btn
                        MyButton(
                          myColor: Colors.deepOrange,
                          buttonName: 'Sign Up',
                          onPressedFunction: () async {
                            if (_formKey.currentState!.validate()) {
                              saveDataToShared();
                              /*
                              // Read the data, decode it and store it in map structure
                              // final prefs = await SharedPreferences.getInstance();
                              Map<String,dynamic> jsondatais = jsonDecode(prefs.getString('userdata')!);
                              var userData = RequestSignup.fromJson(jsondatais);
                              print(userData.firstName);
                              print(userData.email);*/
                              var phone = phoneController.text;
                              var email = emailController.text;
                              RequestGenerateOtp requestGenerateOtp =
                                  RequestGenerateOtp(
                                      phone: phone,
                                      countryId: 1,
                                      otpType: "OTP_TYPE_REGISTRATION",
                                      email: email,
                                      clientKey: Constants().clientKey);
                              BlocProvider.of<GenerateOtpBloc>(context)
                                  .add(CallGenerateOtp(requestGenerateOtp));
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  saveDataToShared() async {
    var firstName =firstNameController.text;
    var lastName=lastNameController.text;
    var email = emailController.text;
    var password=passwordController.text;
    var phone = phoneController.text;
    final prefs = await SharedPreferences.getInstance();
    final String? appId = prefs.getString('appId');
    RequestSignup requestSignUp=RequestSignup(firstName: firstName,lastName: lastName,email: email,password: password,phone:phone,countryId: 1,clientKey: Constants().clientKey,appId: appId);
    // encode / convert object into json string
    String user = jsonEncode(requestSignUp);
    if (kDebugMode) {
      print(user);
    }
    //save the data into sharedPreferences using key-value pairs
    await PreferenceUtils.setString('userdata', user);
  }
}
