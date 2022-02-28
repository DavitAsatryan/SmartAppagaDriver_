import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:login_register_token/screens/Menu/Profile/ProfileNumbers.dart';
import 'package:login_register_token/screens/Menu/Profile/Widget/ProfileCarData.dart';

import '../../../repository.dart';
import '../../Auth_Bloc/bloc/auth_bloc.dart';

part 'profile_edit_event.dart';
part 'profile_edit_state.dart';

class ProfileEditBloc extends Bloc<ProfileEditEvent, ProfileEditState> {
  final UserRepository userRepository;
  final AuthBloc authenticationBloc;

  ProfileEditBloc(
      {required this.authenticationBloc, required this.userRepository})
      : super(ProfileEditInitial()) {
    on<ProfileEditEvent>((event, emit) async {
      if (event is ProfileEditButtonPressed) {
        emit(ProfileEditLoading());

        try {
          var token = await FlutterSession().get("token");
          final profileEdit = await userRepository.profileSendData(ProfileModel(
              image: event.imagePath,
              fullname: event.fullName,
              phoneNumber: event.phones,
              carsData: event.cars,
              isOne: event.isOne,
              isTwo: event.isTwo,
              isThree: event.isThree,
              isFour: event.isFour));

          authenticationBloc.add(LoggedIn(token: token));
          emit(ProfileEditInitial());
        } catch (error) {
          emit(ProfileEditFailure(error: error.toString()));
        }
      }
    });
  }
}
