part of 'package:ev_verde/bloc/chargedetailpoint_bloc.dart';

class ChargeDetailPointState extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
class ChargeDetailPointInitial extends ChargeDetailPointState{}

class ChargeDetailPointLoading extends ChargeDetailPointState{}

class ChargeDetailPointLoaded extends ChargeDetailPointState{
  ResponseChargeDetailPoint responseChargeDetailPoint;
  ChargeDetailPointLoaded(this.responseChargeDetailPoint);
}

class ChargeDetailPointError extends ChargeDetailPointState{
  String error;
  ChargeDetailPointError(this.error);
}