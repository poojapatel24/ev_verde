import 'package:dio/dio.dart';
import 'package:ev_verde/bloc/login_bloc.dart';
import 'package:ev_verde/repo/ev_verde_repo.dart';
import 'package:ev_verde/ui/home_page.dart';
import 'package:ev_verde/utils/color_file.dart';
import 'package:ev_verde/widgets/login_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../utils/preference_utils.dart';
import '../widgets/loading_dialog.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: bodyWidget(),
    );
  }

  Widget bodyWidget() {
    return BlocProvider(
      create: (context)=>LoginBloc(EvVerdeRepo()),
      child: BlocConsumer<LoginBloc,LoginState>(
        listener: (context,state) async {
          if(state is LoginLoaded){
            LoadingDialog.hide(context);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.green,
                content: Text('${state.responseLogin.message}'),
              ),
            );
            await PreferenceUtils.setLoginResponse(state.responseLogin.data?.loginResponse);
            if(mounted) {
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomePage()),
            );
            }
          }
          if(state is LoginError){
            LoadingDialog.hide(context);
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.red,
                content: Text(state.error),
              ),
            );
          }
          if(state is LoginLoading){
            //add progress dialog
            LoadingDialog.show(context);
          }
        },
        builder: (context,state){
           return const LoginView();
        },
      ),
    );
  }

}
