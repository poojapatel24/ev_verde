import 'dart:convert';

import 'package:ev_verde/bloc/signup_bloc.dart';
import 'package:ev_verde/bloc/verify_otp_bloc.dart';
import 'package:ev_verde/widgets/regsiter_user.dart';
import 'package:ev_verde/widgets/verifyotp_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/signup/request_signup.dart';
import '../repo/ev_verde_repo.dart';
import '../utils/color_file.dart';
import '../widgets/loading_dialog.dart';

class VerifyOtpPage extends StatefulWidget{
  int? otpExpiresTime;
  VerifyOtpPage({super.key,required this.otpExpiresTime});

  @override
  State<StatefulWidget> createState() => _VerifyOtpPage();
}
class _VerifyOtpPage extends State<VerifyOtpPage>{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: const BackButton(
            color: Colors.black
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        title: const Text('Mobile Verification',style: TextStyle(color: Colors.black,fontFamily: 'Questrial'),),
      ),
      body: bodyWidget(),
    );
  }

 Widget bodyWidget() {
   RequestSignup? requestSignup;
   return BlocProvider(
     create: (context)=>VerifyOtpBloc(EvVerdeRepo()),
     child: BlocConsumer<VerifyOtpBloc,VerifyOtpState>(
       listener: (context,state) async {
         if(state is VerifyOtpLoaded){
           LoadingDialog.hide(context);
           if (kDebugMode) {
             print("bloc listener");
           }
           ScaffoldMessenger.of(context).showSnackBar(
             SnackBar(
               backgroundColor: Colors.green,
               content: Text('${state.responseVerifyOtp.message}'),
             ),
           );
           final prefs = await SharedPreferences.getInstance();
           Map<String, dynamic> jsondatais =
           jsonDecode(prefs.getString('userdata')!);
           var userData = RequestSignup.fromJson(jsondatais);
           final String? appId = prefs.getString('appId');

            requestSignup = RequestSignup(
               firstName: userData.firstName,
               lastName: userData.lastName,
               email: userData.email,
               password: userData.password,
               phone: userData.phone,
               countryId: userData.countryId,
               clientKey: userData.clientKey,
               appId: userData.appId);

           /*if(mounted) {
             Navigator.push(
               context,
               MaterialPageRoute(builder: (context) =>  RegisterUser(requestSignup: requestSignup,)),
             );
           }*/
         }
         if(state is VerifyOtpError){
           LoadingDialog.hide(context);
           ScaffoldMessenger.of(context).showSnackBar(
             SnackBar(
               backgroundColor: Colors.red,
               content: Text(state.error),
             ),
           );
         }
         if(state is VerifyOtpLoading){
           //add progress dialog
           LoadingDialog.show(context);
         }
       },
       
       builder: (context,state){
         if(state is VerifyOtpLoaded){
           if (kDebugMode) {
             print("bloc builder $requestSignup");
           }
            RegisterUser(requestSignup: requestSignup!,);
         }
         return  VerifyOtpView(otpExpiresTime: widget.otpExpiresTime,);
       },
     ),
   );
 }
}