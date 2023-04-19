import 'package:equatable/equatable.dart';
import 'package:ev_verde/model/chargepoint/request_chargepointlist.dart';
import 'package:ev_verde/model/chargepoint/response_chargepointlist.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/signup/request_signup.dart';
import '../model/signup/response_signup.dart';
import '../repo/ev_verde_repo.dart';

part 'events/chargepointlist_event.dart';

part 'states/chargepointlist_state.dart';

class ChargePointListBloc extends Bloc<ChargePointListEvent, ChargePointListState> {
  EvVerdeRepo evVerdeRepo;

  ChargePointListBloc(this.evVerdeRepo) : super(ChargePointListInitial()) {
    on<GetPointList>((event, emit) async {
      try {
        emit(ChargePointListLoading());
        final responseChargePointList =
            await EvVerdeRepo().chargePointList(requestChargePointList: event.requestChargePointList);
        emit(ChargePointListLoaded(responseChargePointList));
      } catch (e) {
        emit(ChargePointListError('error $e'));
      }
    });
  }
}
