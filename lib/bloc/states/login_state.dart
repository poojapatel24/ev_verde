part of 'package:ev_verde/bloc/login_bloc.dart';

class LoginState extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
class LoginInitial extends LoginState{}

class LoginLoading extends LoginState{}

class LoginLoaded extends LoginState{
  ResponseLogin responseLogin;
  LoginLoaded(this.responseLogin);
}

class LoginError extends LoginState{
  String error;
  LoginError(this.error);
}