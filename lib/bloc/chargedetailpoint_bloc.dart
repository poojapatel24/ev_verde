import 'package:equatable/equatable.dart';
import 'package:ev_verde/model/chargepoint/response_chargedetailpoint.dart';
import 'package:ev_verde/model/chargepoint/response_chargepoint.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../repo/ev_verde_repo.dart';
part 'events/chargedetailpoint_event.dart';
part 'states/chargedetailpoint_state.dart';
class ChargeDetailPointBloc extends Bloc<ChargeDetailPointEvent,ChargeDetailPointState>{
  EvVerdeRepo evVerdeRepo;
  ChargeDetailPointBloc(this.evVerdeRepo):super(ChargeDetailPointInitial()){
    on<GetChargeDetailPoint>((event, emit) async {
      try{
        emit(ChargeDetailPointLoading());
        final responseChargeDetailPoint=await EvVerdeRepo().chargeDetailPoint(id: event.id);
        emit(ChargeDetailPointLoaded(responseChargeDetailPoint));
      }catch(e){
        emit(ChargeDetailPointError('$e'));
      }
    });
  }

}