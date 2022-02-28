import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:login_register_token/bloc/Confirm/bloc/confirm_bloc.dart';
import 'package:login_register_token/bloc/ForgetPassword_Bloc/bloc/forget_password_bloc.dart';
import 'package:login_register_token/bloc/ForgetPassword_Bloc/bloc/forget_password_new_bloc.dart';
import 'package:login_register_token/bloc/ForgetPassword_Bloc/bloc/pincode_forget_pass_bloc.dart';
import 'package:login_register_token/bloc/Notification/bloc/notification_bloc.dart';
import 'package:login_register_token/bloc/QRCounterAndReason/bloc/qr_counter_reason_bloc.dart';
import 'package:login_register_token/bloc/QrCodeSend/bloc/qr_send_bloc.dart';

import 'package:login_register_token/bloc/Register_bloc/register_bloc.dart';
import 'package:login_register_token/bloc/profileEdit_send/Password_Bloc/bloc/password_change_bloc.dart';
import 'package:login_register_token/bloc/profileEdit_send/bloc/profile_edit_bloc.dart';

import '../../FIltr_send_text/bloc/filtr_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthenticationEvent, AuthenticationState> {
  // final UserRepository userRepository;

  AuthBloc() : super(AuthenticationUninitialized()) {
    on<AuthenticationEvent>((event, emit) {
      if (event is LoggedIn) {
        emit(AuthenticationLoading());
        // await userRepository.persistToken(event.token);
        emit(AuthenticationAuthenticated());
      }
      if (event is NotificationFetchSuccses) {
        emit(AuthenticationLoading());
        // await userRepository.persistToken(event.token);
        emit(AuthenticationAuthenticated());
      }
      if (event is ConfirmButtonPressed) {
        emit(AuthenticationLoading());
        // await userRepository.persistToken(event.token);
        emit(AuthenticationAuthenticated());
      }
      if (event is ButtonPhoneNumber) {
        emit(AuthenticationLoading());
        // await userRepository.persistToken(event.token);
        emit(AuthenticationAuthenticated());
      }
      if (event is ButtonForgetPasswordNew) {
        emit(AuthenticationLoading());
        // await userRepository.persistToken(event.token);
        emit(AuthenticationAuthenticated());
      }
      if (event is ButtonPinCode) {
        emit(AuthenticationLoading());
        // await userRepository.persistToken(event.token);
        emit(AuthenticationAuthenticated());
      }
      if (event is ProfileEditButtonPressed) {
        emit(AuthenticationLoading());
        // await userRepository.persistToken(event.token);
        emit(AuthenticationAuthenticated());
      }
      if (event is QrCounterReasonButtonPressed) {
        emit(AuthenticationLoading());
        // await userRepository.persistToken(event.token);
        emit(AuthenticationAuthenticated());
      }

      if (event is QrSendButtonPressed) {
        emit(AuthenticationLoading());
        // await userRepository.persistToken(event.token);
        emit(AuthenticationAuthenticated());
      }
      if (event is FiltrUnassignedButtonPressed) {
        emit(AuthenticationLoading());
        // await userRepository.persistToken(event.token);
        emit(AuthenticationAuthenticated());
      }
      if (event is PasswordChangeButtonPressed) {
        emit(AuthenticationLoading());
        // await userRepository.persistToken(event.token);
        emit(AuthenticationAuthenticated());
      }

      if (event is RegisternButtonPressed) {
        emit(AuthenticationLoading());
        // await userRepository.persistToken(event.token);
        emit(AuthenticationAuthenticated());
      }
      if (event is LoggedOut) {
        emit(AuthenticationLoading());
        //  await userRepository.deleteToken();
        emit(AuthenticationUnauthenticated());
      }
    });
  }
}
