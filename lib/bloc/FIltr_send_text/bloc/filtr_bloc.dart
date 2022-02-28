import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_session/flutter_session.dart';

import '../../../repository.dart';
import '../../Auth_Bloc/bloc/auth_bloc.dart';

part 'filtr_event.dart';
part 'filtr_state.dart';

class FiltrBloc extends Bloc<FiltrEvent, FiltrState> {
  static String base_url = 'https://phpstack-351614-1150808.cloudwaysapps.com';
  static var api_url = base_url + '/api/customer';

  final UserRepository userRepository;
  final AuthBloc authenticationBloc;
  FiltrBloc({required this.authenticationBloc, required this.userRepository})
      : super(FiltrInitial()) {
    on<FiltrEvent>((event, emit) async {
      if (event is FiltrUnassignedButtonPressed) {
        emit(FiltrLoading());

        try {
          var token = await FlutterSession().get("token");
          final filtr = await userRepository.filtrdSendData(
              FiltrModel(unassignedText: event.unassignedText),
              api_url,
              '/login');

          authenticationBloc.add(LoggedIn(token: token));
          emit(FiltrInitial());
        } catch (error) {
          emit(FiltrFailure(error: error.toString()));
        }
      } else if (event is FiltrAssignedButtonPressed) {
        emit(FiltrLoading());

        try {
          var token = await FlutterSession().get("token");
          final filtr = await userRepository.filtrdSendData(
              FiltrModel(unassignedText: event.assignedText),
              api_url,
              '/login');

          authenticationBloc.add(LoggedIn(token: token));
          emit(FiltrInitial());
        } catch (error) {
          emit(FiltrFailure(error: error.toString()));
        }
      } else if (event is FiltrCanceledButtonPressed) {
        emit(FiltrLoading());

        try {
          var token = await FlutterSession().get("token");
          final filtr = await userRepository.filtrdSendData(
              FiltrModel(unassignedText: event.canceledText),
              api_url,
              '/login');

          authenticationBloc.add(LoggedIn(token: token));
          emit(FiltrInitial());
        } catch (error) {
          emit(FiltrFailure(error: error.toString()));
        }
      } else if (event is FiltrCompletedButtonPressed) {
        emit(FiltrLoading());

        try {
          var token = await FlutterSession().get("token");
          final filtr = await userRepository.filtrdSendData(
              FiltrModel(unassignedText: event.completedText),
              api_url,
              '/login');

          authenticationBloc.add(LoggedIn(token: token));
          emit(FiltrInitial());
        } catch (error) {
          emit(FiltrFailure(error: error.toString()));
        }
      } else if (event is FiltrIncompleteButtonPressed) {
        emit(FiltrLoading());

        try {
          var token = await FlutterSession().get("token");
          final filtr = await userRepository.filtrdSendData(
              FiltrModel(unassignedText: event.incompleteText),
              api_url,
              '/login');

          authenticationBloc.add(LoggedIn(token: token));
          emit(FiltrInitial());
        } catch (error) {
          emit(FiltrFailure(error: error.toString()));
        }
      } else if (event is FiltrMissedButtonPressed) {
        emit(FiltrLoading());

        try {
          var token = await FlutterSession().get("token");
          final filtr = await userRepository.filtrdSendData(
              FiltrModel(unassignedText: event.missedText), api_url, '/login');

          authenticationBloc.add(LoggedIn(token: token));
          emit(FiltrInitial());
        } catch (error) {
          emit(FiltrFailure(error: error.toString()));
        }
      }
    });
  }
}
