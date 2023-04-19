part of 'package:ev_verde/bloc/generate_otp_bloc.dart';

class GenerateOtpState extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
class GenerateOtpInitial extends GenerateOtpState{}

class GenerateOtpLoading extends GenerateOtpState{}

class GenerateOtpLoaded extends GenerateOtpState{
  ResponseGenerateOtp responseGenerateOtp;
  GenerateOtpLoaded(this.responseGenerateOtp);
}

class GenerateOtpError extends GenerateOtpState{
  String error;
  GenerateOtpError(this.error);
}