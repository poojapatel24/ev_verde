import 'package:ev_verde/ui/signup_page.dart';
import 'package:ev_verde/ui/verify_otp_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wc_form_validators/wc_form_validators.dart';

import '../bloc/login_bloc.dart';
import '../components/my_button.dart';
import '../components/my_textfield.dart';
import '../model/login/request_login.dart';
import '../utils/constants.dart';
import '../utils/preference_utils.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<StatefulWidget> createState() => _LoginView();
}

class _LoginView extends State<LoginView> {
  @override
  Widget build(BuildContext context) {
    final usernameController = TextEditingController(text: '8306683534');
    final passwordController = TextEditingController(text: '355Kunal\$');
    final _formKey = GlobalKey<FormState>();
    return Builder(builder: (context) {
      return SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //logo
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: SizedBox(
                  height: 100,
                  child: Image.asset(
                    "assets/images/logo.png",
                    opacity: const AlwaysStoppedAnimation(0.3),
                  ),
                ),
              ),
              //login text
              const Text(
                'Login',
                style: TextStyle(
                    fontFamily: 'PoiretOne',
                    fontSize: 20,
                    fontWeight: FontWeight.w900),
              ),
              const SizedBox(
                height: 25,
              ),

              //Text field
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      MyTextField(
                        myController: usernameController,
                        isObscureText: false,
                        myLabelText: 'Email address / Mobile number',
                        myHintText: 'Enter Email /Mobile nnumber',
                        myValidatorFunction: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter Email address /Mobile number';
                          }
                          return null;
                        },
                        prefixIcon: Icons.alternate_email,
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
                        height: 50,
                      ),

                      //signin btn
                      MyButton(
                        myColor: Colors.deepOrange,
                        buttonName: 'Log In',
                        onPressedFunction: () async{
                          if (_formKey.currentState!.validate()) {
                            var email = usernameController.text;
                            var pwd = passwordController.text;
                            if (kDebugMode) {
                              print(email);
                              print(pwd);
                            }
                            final prefs = await SharedPreferences.getInstance();
                            final String? appId = prefs.getString('appId');
                            if (kDebugMode) {
                              print('appid at login  $appId');
                            }
                            RequestLogin requestLogin = RequestLogin(
                                emailOrPhone: email,
                                password: pwd,
                                clientKey: Constants().clientKey,
                                appId: appId);
                            BlocProvider.of<LoginBloc>(context)
                                .add(CallLogin(requestLogin));
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),

              Align(
                alignment: Alignment.bottomCenter,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SignupPage()),
                      //MaterialPageRoute(builder: (context) => const VerifyOtpPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                    foregroundColor: Colors.black,
                    elevation: 0,
                  ),
                  child: RichText(
                    text: const TextSpan(
                      text: 'Not a member?',
                      style: TextStyle(color: Colors.black),
                      children: [
                        TextSpan(
                            text: ' Create an Account',
                            style: TextStyle(
                                color: Colors.blue,
                                fontStyle: FontStyle.italic,
                                fontFamily: 'Questrial')),
                      ],
                    ),
                  ),
                  //const Text('Not a member? Create an Account'),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
