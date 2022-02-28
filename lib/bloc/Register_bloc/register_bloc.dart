import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:login_register_token/bloc/Auth_Bloc/bloc/auth_bloc.dart';

import '../../repository.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final UserRepository userRepository;
  final AuthBloc authenticationBloc;
  RegisterBloc({required this.userRepository, required this.authenticationBloc})
      : super(RegisterInitial()) {
    on<RegisterEvent>((event, emit) async {
      print("register");
      if (event is RegisternButtonPressed) {
        print("register");
        emit(RegisterLoading());

        try {
          var token = await FlutterSession().get("token");
          final user = await userRepository.register(UserRegister(
            email: event.email,
            password: event.password,
            fullname: event.fullname,
            phoneNumber: event.phoneNumber,
          ));

          authenticationBloc.add(LoggedIn(token: token));
          emit(RegisterInitial());
        } catch (error) {
          emit(RegisterFailure(error: error.toString()));
        }
      }
    });
  }

  // @override
  // Stream<RegisterState> mapEventToState(RegisterEvent event) async* {}

}
