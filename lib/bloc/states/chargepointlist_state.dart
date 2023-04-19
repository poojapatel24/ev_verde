part of 'package:ev_verde/bloc/chargepointlist_bloc.dart';


class ChargePointListState extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
class ChargePointListInitial extends ChargePointListState{}

class ChargePointListLoading extends ChargePointListState{}

class ChargePointListLoaded extends ChargePointListState{
  ResponseChargePointList responseChargePointList;
  ChargePointListLoaded(this.responseChargePointList);
}

class ChargePointListError extends ChargePointListState{
  String error;
  ChargePointListError(this.error);
}