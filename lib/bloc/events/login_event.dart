part of 'package:ev_verde/bloc/login_bloc.dart';

class LoginEvent extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class CallLogin extends LoginEvent{
  RequestLogin requestLogin;
  CallLogin(this.requestLogin);
}