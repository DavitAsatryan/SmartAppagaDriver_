import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_session/flutter_session.dart';

import '../../../../repository.dart';
import '../../../Auth_Bloc/bloc/auth_bloc.dart';

part 'password_change_event.dart';
part 'password_change_state.dart';

class PasswordChangeBloc
    extends Bloc<PasswordChangeEvent, PasswordChangeState> {
  final UserRepository userRepository;
  final AuthBloc authenticationBloc;
  PasswordChangeBloc(
      {required this.userRepository, required this.authenticationBloc})
      : super(PasswordChangeInitial()) {
    on<PasswordChangeEvent>((event, emit) async {
      if (event is PasswordChangeButtonPressed) {
        emit(PasswordChangeLoading());

        try {
          var token = await FlutterSession().get("token");
          final passwordChange = await userRepository.passwordChange(
              PasswordChange(
                  password: event.password,
                  newPassword: event.newPassword,
                  newPasswordTwo: event.newPasswordTwo));

          authenticationBloc.add(LoggedIn(token: token));
          emit(PasswordChangeInitial());
        } catch (error) {
          emit(PasswordChangeFailure(error: error.toString()));
        }
      }
    });
  }
}
