import 'package:equatable/equatable.dart';
import 'package:ev_verde/model/login/request_login.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/login/response_login.dart';
import '../repo/ev_verde_repo.dart';

part 'events/login_event.dart';
part 'states/login_state.dart';
class LoginBloc extends Bloc<LoginEvent,LoginState>{
  EvVerdeRepo evVerdeRepo;
  LoginBloc(this.evVerdeRepo):super(LoginInitial()){
    on<CallLogin>((event, emit) async {
      try{
       emit(LoginLoading());
       final responseLogin=await EvVerdeRepo().login(requestLogin: event.requestLogin);
       emit(LoginLoaded(responseLogin));
      }catch(e){
        emit(LoginError('Error $e'));
      }      
    });
  }
  
}