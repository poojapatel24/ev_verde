part of 'package:ev_verde/bloc/signup_bloc.dart';

class SignupEvent extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class CallSignup extends SignupEvent{
  RequestSignup requestSignup;
  CallSignup(this.requestSignup);
}