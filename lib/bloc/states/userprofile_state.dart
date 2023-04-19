part of 'package:ev_verde/bloc/userprofile_bloc.dart';
class UserProfileState extends Equatable{
  @override
  // TODO: implement props
  List<Object?> get props => [];

}
class UserProfileInitial extends UserProfileState{}

class UserProfileLoading extends UserProfileState{}

class UserProfileLoaded extends UserProfileState{
  ResponseUserProfile responseUserProfile;
  UserProfileLoaded(this.responseUserProfile);
}

class UserProfileError extends UserProfileState{
  String error;
  UserProfileError(this.error);
}