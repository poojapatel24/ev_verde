import 'package:equatable/equatable.dart';
import 'package:ev_verde/model/otp/request_generate_otp.dart';
import 'package:ev_verde/model/otp/response_generate_otp.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../repo/ev_verde_repo.dart';
part 'events/generate_otp_event.dart';
part 'states/generate_otp_state.dart';
class GenerateOtpBloc extends Bloc<GenerateOtpEvent,GenerateOtpState>{
  EvVerdeRepo evVerdeRepo;
  GenerateOtpBloc(this.evVerdeRepo):super(GenerateOtpInitial()){

    on<CallGenerateOtp>((event, emit) async {
      try{
        emit(GenerateOtpLoading());
        final responseGenerateOtp=await EvVerdeRepo().generateOtp(requestGenerateOtp: event.requestGenerateOtp);
        emit(GenerateOtpLoaded(responseGenerateOtp));
      }catch(e){
        emit(GenerateOtpError('Error $e'));
      }
    });
  }
}