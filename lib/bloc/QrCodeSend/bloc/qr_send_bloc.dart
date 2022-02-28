import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_session/flutter_session.dart';

import '../../../repository.dart';
import '../../Auth_Bloc/bloc/auth_bloc.dart';

part 'qr_send_event.dart';
part 'qr_send_state.dart';

class QrSendBloc extends Bloc<QrSendEvent, QrSendState> {
  final UserRepository userRepository;
  final AuthBloc authenticationBloc;

  QrSendBloc({required this.authenticationBloc, required this.userRepository})
      : super(QrSendInitial()) {
    on<QrSendEvent>((event, emit) async {
      if (event is QrSendButtonPressed) {
        emit(QrSendLoading());

        try {
          var token = await FlutterSession().get("token");
          final qrSendCode = await userRepository
              .qrCodeSend(QrCodeSendModel(qrCode: event.qrSendCode));

          authenticationBloc.add(LoggedIn(token: token));
          emit(QrSendInitial());
        } catch (error) {
          emit(QrSendFailure(error: error.toString()));
        }
      }
    });
  }
}
