import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_register_token/bloc/Auth_Bloc/bloc/auth_bloc.dart';

import 'package:login_register_token/screens/register_form.dart';

import '../bloc/Register_bloc/register_bloc.dart';
import '../repository.dart';

class RegisterScreen extends StatelessWidget {
  final UserRepository userRepository;

  const RegisterScreen({Key? key, required this.userRepository})
      : assert(userRepository != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocProvider(
        create: (context) {
          return RegisterBloc(
            authenticationBloc: BlocProvider.of<AuthBloc>(context),
            userRepository: userRepository,
          );
        },
        child: RegisterForm(
          userRepository: userRepository,
        ),
      ),
    );
  }
}
