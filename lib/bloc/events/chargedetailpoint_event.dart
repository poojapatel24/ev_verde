part of 'package:ev_verde/bloc/chargedetailpoint_bloc.dart';


class ChargeDetailPointEvent extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class GetChargeDetailPoint extends ChargeDetailPointEvent{
  int id;
  GetChargeDetailPoint(this.id);
}