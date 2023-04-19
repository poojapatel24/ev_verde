part of 'package:ev_verde/bloc/chargepointlist_bloc.dart';

class ChargePointListEvent extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}

class GetPointList extends ChargePointListEvent{
  RequestChargePointList requestChargePointList;
  GetPointList(this.requestChargePointList);
}