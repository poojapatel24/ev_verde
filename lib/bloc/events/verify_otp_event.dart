part of 'package:ev_verde/bloc/verify_otp_bloc.dart';
class VerifyOtpEvent extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
class CallVerifyOtp extends VerifyOtpEvent{
  RequestVerifyOtp requestVerifyOtp;
  CallVerifyOtp(this.requestVerifyOtp);
}