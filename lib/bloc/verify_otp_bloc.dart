import 'package:equatable/equatable.dart';
import 'package:ev_verde/model/otp/request_verify_otp.dart';
import 'package:ev_verde/model/otp/resposne_verify_otp.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../repo/ev_verde_repo.dart';

part 'events/verify_otp_event.dart';
part 'states/verify_otp_state.dart';
class VerifyOtpBloc extends Bloc<VerifyOtpEvent,VerifyOtpState> {
  EvVerdeRepo evVerdeRepo;
  VerifyOtpBloc(this.evVerdeRepo):super(VerifyOtpInitial()){

    on<CallVerifyOtp>((event, emit) async {
      try{
        emit(VerifyOtpLoading());
        final responseVerifyOtp=await EvVerdeRepo().verifyOtp(requestVerifyOtp: event.requestVerifyOtp);
        emit(VerifyOtpLoaded(responseVerifyOtp));
      }catch(e){
        emit(VerifyOtpError('$e'));
      }
    });
  }

}