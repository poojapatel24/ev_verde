part of 'package:ev_verde/bloc/chargepoint_bloc.dart';

class ChargePointState extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
class ChargePointInitial extends ChargePointState{}

class ChargePointLoading extends ChargePointState{}

class ChargePointLoaded extends ChargePointState{
  ResponseChargePoint responseChargePoint;
  ChargePointLoaded(this.responseChargePoint);
}

class ChargePointError extends ChargePointState{
  String error;
  ChargePointError(this.error);
}