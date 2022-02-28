import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_session/flutter_session.dart';

import '../../../repository.dart';
import '../../Auth_Bloc/bloc/auth_bloc.dart';

part 'forget_password_event.dart';
part 'forget_password_state.dart';

class ForgetPasswordBloc
    extends Bloc<ForgetPasswordEvent, ForgetPasswordState> {
  final UserRepository userRepository;
  final AuthBloc authenticationBloc;
  ForgetPasswordBloc(
      {required this.authenticationBloc, required this.userRepository})
      : super(ForgetPasswordInitial()) {
    on<ForgetPasswordEvent>((event, emit) async {
      if (event is ButtonPhoneNumber) {
        emit(ForgetPasswordLoading());

        try {
          var token = await FlutterSession().get("token");
          final phoneNumber = await userRepository.phoneNumberSend(
              PhoneNumberModel(phoneNumber: event.phoneNumberText));

          authenticationBloc.add(LoggedIn(token: token));
          emit(ForgetPasswordInitial());
        } catch (error) {
          emit(ForgetPasswordFailure(error: error.toString()));
        }
      }
    });
  }
}
