import 'dart:convert';

import 'package:ev_verde/bloc/signup_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/signup/request_signup.dart';
import '../repo/ev_verde_repo.dart';

class RegisterUser extends StatefulWidget {
  RequestSignup requestSignup;
  RegisterUser({super.key,required this.requestSignup});

  @override
  State<StatefulWidget> createState() => _RegisterUser();
}

class _RegisterUser extends State<RegisterUser> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: registerUser(),
    );
  }

  Widget registerUser() {

    return BlocProvider(
      create: (context) => SignupBloc(EvVerdeRepo()),//..add(CallSignup(widget.requestSignup!)),
      child: BlocConsumer<SignupBloc, SignupState>(
        listener: (context, state) async {
          if (state is SignupLoaded) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.green,
                content: Text('${state.responseSignup.message}'),
              ),
            );
          } else if (state is SignupError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.red,
                content: Text(state.error),
              ),
            );
          } else if (state is SignupLoading) {
            //add progress dialog
          }
        },
        builder: (context, state) {
          return Container();
        },
      ),
    );
  }


}
