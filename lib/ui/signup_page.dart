import 'package:ev_verde/bloc/generate_otp_bloc.dart';
import 'package:ev_verde/bloc/signup_bloc.dart';
import 'package:ev_verde/ui/verify_otp_page.dart';
import 'package:ev_verde/widgets/signup_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../repo/ev_verde_repo.dart';
import '../utils/color_file.dart';
import '../widgets/loading_dialog.dart';

class SignupPage extends StatefulWidget{
  const SignupPage({super.key});

  @override
  State<StatefulWidget> createState() => _SignupPage();

}
class _SignupPage extends State<SignupPage>{
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
        title: const Text('Create An Account',style: TextStyle(color: Colors.black,fontFamily: 'Questrial'),),
      ),
      body: bodyWidget(),
    );
  }
  Widget bodyWidget() {
    return BlocProvider(
      create: (context)=>GenerateOtpBloc(EvVerdeRepo()),
      child: BlocConsumer<GenerateOtpBloc,GenerateOtpState>(
        listener: (context,state) async {
          if(state is GenerateOtpLoaded){
            LoadingDialog.hide(context);
            if (kDebugMode) {
              print(state.responseGenerateOtp.data?.otpExpiresInSeconds);
            }
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.green,
                content: Text('${state.responseGenerateOtp.message}'),
              ),
            );
            if(mounted) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => VerifyOtpPage(otpExpiresTime: state.responseGenerateOtp.data?.otpExpiresInSeconds,)),
              );
            }
          }
          if(state is GenerateOtpError){
            LoadingDialog.hide(context);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.red,
                content: Text(state.error),
              ),
            );
          }
          if(state is GenerateOtpLoading){
            //add progress dialog
            LoadingDialog.show(context);
          }
        },
        builder: (context,state){
          return const SignupView();
        },
      ),
    );
  }


}