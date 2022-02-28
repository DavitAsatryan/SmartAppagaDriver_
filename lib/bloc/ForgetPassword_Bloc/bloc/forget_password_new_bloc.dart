import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_session/flutter_session.dart';

import '../../../repository.dart';
import '../../Auth_Bloc/bloc/auth_bloc.dart';

part 'forget_password_new_event.dart';
part 'forget_password_new_state.dart';

class ForgetPasswordNewBloc
    extends Bloc<ForgetPasswordNewEvent, ForgetPasswordNewState> {
  final UserRepository userRepository;
  final AuthBloc authenticationBloc;
  ForgetPasswordNewBloc(
      {required this.authenticationBloc, required this.userRepository})
      : super(ForgetPasswordNewInitial()) {
    on<ForgetPasswordNewEvent>((event, emit) async {
      if (event is ButtonForgetPasswordNew) {
        emit(ForgetPasswordNewLoading());
        try {
          var token = await FlutterSession().get("token");
          final passwordNew = await userRepository.passwordNewSend(PasswordNew(
              password: event.passwordText,
              passwordTwo: event.passwordTwoText));

          authenticationBloc.add(LoggedIn(token: token));
          emit(ForgetPasswordNewInitial());
        } catch (error) {
          emit(ForgetPasswordNewFailure(error: error.toString()));
        }
      }
    });
  }
}
