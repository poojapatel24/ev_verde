import 'package:equatable/equatable.dart';
import 'package:ev_verde/model/user/response_userprofile.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../repo/ev_verde_repo.dart';
part 'events/userprofile_event.dart';

part 'states/userprofile_state.dart';
class UserProfileBloc extends Bloc<UserProfileEvent,UserProfileState>{
  EvVerdeRepo evVerdeRepo;

  UserProfileBloc(this.evVerdeRepo) : super(UserProfileInitial()) {
    on<GetUserData>((event, emit) async {
      try {
        emit(UserProfileLoading());
        final responseUserProfile =
        await EvVerdeRepo().getUserProfile();
        emit(UserProfileLoaded(responseUserProfile));
      } catch (e) {
        emit(UserProfileError('error $e'));
      }
    });
  }

}