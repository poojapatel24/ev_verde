part of 'package:ev_verde/bloc/device_bloc.dart';
class DeviceEvent extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
class GetDeviceActivity extends DeviceEvent{
  RequestDevice requestDevice;
  GetDeviceActivity(this.requestDevice);
}
