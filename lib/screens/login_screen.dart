import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:login_register_token/bloc/Auth_Bloc/bloc/auth_bloc.dart';
import 'package:login_register_token/bloc/Login_bloc/login_bloc.dart';

import '../repository.dart';
import 'login_form.dart';

class LoginScreen extends StatelessWidget {
  final UserRepository userRepository;

  const LoginScreen({Key? key, required this.userRepository})
      : assert(userRepository != null),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocProvider(
        create: (context) {
          return LoginBloc(
            authenticationBloc: BlocProvider.of<AuthBloc>(context),
            userRepository: userRepository,
          );
        },
        child: LoginForm(
          userRepository: userRepository,
        ),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Color.fromRGBO(169, 169, 169, 1),
              width: 1,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Padding(
              padding: EdgeInsets.only(right: 10, top: 4),
              child: Text(
                "Terms of Use",
                style: TextStyle(
                    fontSize: 12, color: Color.fromRGBO(65, 132, 130, 1)),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 4),
              child: Text(
                "Privacy Policy",
                style: TextStyle(
                    fontSize: 12, color: Color.fromRGBO(65, 132, 130, 1)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
