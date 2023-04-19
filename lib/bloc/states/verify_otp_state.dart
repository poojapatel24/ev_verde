part of 'package:ev_verde/bloc/verify_otp_bloc.dart';
class VerifyOtpState extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class VerifyOtpInitial extends VerifyOtpState{}

class VerifyOtpLoading extends VerifyOtpState{}

class VerifyOtpLoaded extends VerifyOtpState{
  ResponseVerifyOtp responseVerifyOtp;
  VerifyOtpLoaded(this.responseVerifyOtp);
}

class VerifyOtpError extends VerifyOtpState{
  String error;
  VerifyOtpError(this.error);
}