import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_session/flutter_session.dart';

import '../../../repository.dart';
import '../../Auth_Bloc/bloc/auth_bloc.dart';

part 'pincode_forget_pass_event.dart';
part 'pincode_forget_pass_state.dart';

class PincodeForgetPassBloc
    extends Bloc<PincodeForgetPassEvent, PincodeForgetPassState> {
  final UserRepository userRepository;
  final AuthBloc authenticationBloc;
  PincodeForgetPassBloc(
      {required this.authenticationBloc, required this.userRepository})
      : super(PincodeForgetPassInitial()) {
    on<PincodeForgetPassEvent>((event, emit) async {
      if (event is ButtonPinCode) {
        emit(ForgetPinCodeLoading());
        try {
          var token = await FlutterSession().get("token");
          final pinCode = await userRepository
              .pinCodeSend(PinCodeModel(pinCode: event.pinCodeText));

          authenticationBloc.add(LoggedIn(token: token));
          emit(PincodeForgetPassInitial());
        } catch (error) {
          emit(ForgetPinCodeFailure(error: error.toString()));
        }
      }
    });
  }
}
