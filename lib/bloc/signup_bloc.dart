import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../model/signup/request_signup.dart';
import '../model/signup/response_signup.dart';
import '../repo/ev_verde_repo.dart';

part 'events/signup_event.dart';

part 'states/signup_state.dart';

class SignupBloc extends Bloc<SignupEvent, SignupState> {
  EvVerdeRepo evVerdeRepo;

  SignupBloc(this.evVerdeRepo) : super(SignupInitial()) {
    on<CallSignup>((event, emit) async {
      try {
        emit(SignupLoading());
        final responseSignup =
            await EvVerdeRepo().signUp(requestSignup: event.requestSignup);
        emit(SignupLoaded(responseSignup));
      } catch (e) {
        emit(SignupError('error $e'));
      }
    });
  }
}
