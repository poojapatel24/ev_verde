import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../model/deviceactivity/request_device.dart';
import '../model/deviceactivity/response_device.dart';
import '../repo/ev_verde_repo.dart';
part 'events/device_event.dart';
part 'states/device_state.dart';
class DeviceBloc extends Bloc<DeviceEvent,DeviceState>{
  EvVerdeRepo evVerdeRepo;
  DeviceBloc(this.evVerdeRepo):super(DeviceInitial()){

    on<GetDeviceActivity>((event, emit) async {
        try{
          emit(DeviceLoading());
          final responseDevice=await EvVerdeRepo().deviceActivity(requestDevice: event.requestDevice);
          emit(DeviceLoaded(responseDevice));
        }catch(e){
          emit(DeviceError('Error $e'));
        }
    });
  }


}