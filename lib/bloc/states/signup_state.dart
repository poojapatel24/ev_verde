part of 'package:ev_verde/bloc/signup_bloc.dart';


class SignupState extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
class SignupInitial extends SignupState{}

class SignupLoading extends SignupState{}

class SignupLoaded extends SignupState{
  ResponseSignup responseSignup;
  SignupLoaded(this.responseSignup);
}

class SignupError extends SignupState{
  String error;
  SignupError(this.error);
}