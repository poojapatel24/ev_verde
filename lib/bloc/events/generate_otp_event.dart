part of 'package:ev_verde/bloc/generate_otp_bloc.dart';
class GenerateOtpEvent extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
class CallGenerateOtp extends GenerateOtpEvent{
  RequestGenerateOtp requestGenerateOtp;
  CallGenerateOtp(this.requestGenerateOtp);
}