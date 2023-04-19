import 'dart:convert';

import 'package:ev_verde/bloc/verify_otp_bloc.dart';
import 'package:ev_verde/model/otp/request_verify_otp.dart';
import 'package:ev_verde/utils/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_countdown_timer/countdown_timer_controller.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

import '../components/my_button.dart';
import '../components/my_textfield.dart';
import '../model/signup/request_signup.dart';

class VerifyOtpView extends StatefulWidget {
  int? otpExpiresTime;

  VerifyOtpView({super.key, required this.otpExpiresTime});

  @override
  State<StatefulWidget> createState() => _VerifyOtpView();
}

class _VerifyOtpView extends State<VerifyOtpView> {
  final _formKey = GlobalKey<FormState>();
  final otpController = TextEditingController();
  String? verificationCode;
  int? endTime;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    endTime = widget.otpExpiresTime! + 1000 * 30;
  }

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Padding(
        padding: const EdgeInsets.all(10),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/OTP.png',
                        width: 300,
                        height: 250,
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      const Text(
                        'OTP Verification',
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Questrial'),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      OtpTextField(
                        numberOfFields: 6,
                        enabledBorderColor: Colors.black,
                        borderColor: Colors.green,
                        focusedBorderColor: Colors.green,
                        //set to true to show as box or false to show as dash
                        showFieldAsBox: true,
                        //runs when a code is typed in
                        onCodeChanged: (String code) {
                          //handle validation or checks here
                        },
                        //runs when every textfield is filled
                        onSubmit: (String verificationCode) {
                          this.verificationCode = verificationCode;
                        }, // end onSubmit
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Row(
                        children: [
                          const Text('Resend code in '),
                          getCountDown(),
                        ],
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      MyButton(
                        myColor: Colors.deepOrange,
                        buttonName: 'Verify',
                        onPressedFunction: () async {
                          final prefs = await SharedPreferences.getInstance();
                          Map<String, dynamic> jsondatais =
                              jsonDecode(prefs.getString('userdata')!);
                          var userData = RequestSignup.fromJson(jsondatais);
                          final String? appId = prefs.getString('appId');
                          var otp = verificationCode;
                          if (kDebugMode) {
                            print(otp);
                          }
                          RequestVerifyOtp requestVerifyOtp = RequestVerifyOtp(
                              phone: userData.phone,
                              otp: otp,
                              clientKey: Constants().clientKey,
                              appId: appId);

                           BlocProvider.of<VerifyOtpBloc>(context)
                                .add(CallVerifyOtp(requestVerifyOtp));
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

  void onEnd() {
    print('onEnd');
  }

  Widget getCountDown() {
    return CountdownTimer(
      controller: CountdownTimerController(endTime: endTime!, onEnd: onEnd),
      widgetBuilder: (context, CurrentRemainingTime? time) {
        if (time == null) {
          return InkWell(
            onTap: () {
                  // call to generate otp api
             },
            child: const Text(
              'Resend',
              style: TextStyle(
                  color: Colors.green, decoration: TextDecoration.underline),
            ),
          );
          /*return const Text(
            'Resend',
            style: TextStyle(
                color: Colors.green, decoration: TextDecoration.underline),
          );*/
        }
        List<Widget> list = [];
        if (time.min != null) {
          list.add(Row(
            children: <Widget>[
              Text(
                time.min.toString(),
                style: const TextStyle(color: Colors.green),
              ),
            ],
          ));
        } else {
          list.add(Row(
            children: const <Widget>[
              Text(
                '0',
                style: TextStyle(color: Colors.green),
              ),
            ],
          ));
        }
        if (time.sec != null) {
          list.add(Row(
            children: <Widget>[
              Text(
                ':${time.sec.toString()}',
                style: const TextStyle(color: Colors.green),
              ),
            ],
          ));
        }

        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: list,
        );
      },
    );
  }
}
