import 'package:equatable/equatable.dart';
import 'package:ev_verde/model/chargepoint/response_chargepoint.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../repo/ev_verde_repo.dart';
part 'events/chargepoint_event.dart';
part 'states/chargepoint_state.dart';
class ChargePointBloc extends Bloc<ChargePointEvent,ChargePointState>{
  EvVerdeRepo evVerdeRepo;
  ChargePointBloc(this.evVerdeRepo):super(ChargePointInitial()){
    on<GetChargePointList>((event, emit) async {
      try{
        emit(ChargePointLoading());
        final responseChargePoint=await EvVerdeRepo().chargePoint();
        emit(ChargePointLoaded(responseChargePoint));
      }catch(e){
        emit(ChargePointError('$e'));
      }
    });
  }

}