part of 'package:ev_verde/bloc/device_bloc.dart';
class DeviceState extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
class DeviceInitial extends DeviceState{}

class DeviceLoading extends DeviceState{}

class DeviceLoaded extends DeviceState{
    ResponseDevice responseDevice;
    DeviceLoaded(this.responseDevice);
}

class DeviceError extends DeviceState{
    String error;
    DeviceError(this.error);
}
