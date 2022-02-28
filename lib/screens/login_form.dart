import 'package:adobe_xd/blend_mask.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:login_register_token/bloc/ForgetPassword_Bloc/bloc/forget_password_bloc.dart';
import 'package:login_register_token/notifications/notificationOrder.dart';
import 'package:login_register_token/screens/register_screen.dart';
import 'package:adobe_xd/pinned.dart';

import '../bloc/Auth_Bloc/bloc/auth_bloc.dart';
import '../bloc/Login_bloc/login_bloc.dart';
import '../repository.dart';
import 'Forget_Password/forget_password.dart';

class LoginForm extends StatefulWidget {
  final UserRepository userRepository;
  LoginForm({Key? key, required this.userRepository})
      : assert(userRepository != null),
        super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState(userRepository);
}

class _LoginFormState extends State<LoginForm> {
  bool passwordVisibility = false;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  final UserRepository userRepository;
  _LoginFormState(this.userRepository);
  final _usernameController =
      TextEditingController(text: "davit.asatryan2020@gmail.com");
  final _passwordController = TextEditingController(text: "application..");
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    Color getColor(Set<MaterialState> states) {
      const Set<MaterialState> interactiveStates = <MaterialState>{
        MaterialState.pressed,
        MaterialState.hovered,
        MaterialState.focused,
      };
      if (states.any(interactiveStates.contains)) {
        return const Color.fromARGB(255, 0, 144, 115);
      }
      return const Color.fromRGBO(12, 128, 64, 1);
    }

    _onLoginButtonPressed() {
      BlocProvider.of<LoginBloc>(context).add(
        LoginButtonPressed(
          email: _usernameController.text,
          password: _passwordController.text,
        ),
      );
    }

    return BlocListener<LoginBloc, LoginState>(
      listener: (context, state) {
        if (state is LoginFailure) {
          Scaffold.of(context).showSnackBar(
            const SnackBar(
              content: Text("Login failed."),
              backgroundColor: Colors.red,
            ),
          );
        }
      },
      child: BlocBuilder<LoginBloc, LoginState>(
        builder: (context, state) {
          return Padding(
            padding:
                const EdgeInsets.only(right: 0, left: 0, top: 0, bottom: 0),
            child: Form(
              key: formKey,
              child: Scaffold(
                resizeToAvoidBottomInset: false,
                key: scaffoldKey,
                backgroundColor: const Color(0xFFF5F5F5),
                body: GestureDetector(
                  onTap: () => FocusScope.of(context).unfocus(),
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                      image: AssetImage("assets/login.png"),
                      fit: BoxFit.cover,
                    )),
                    child: Stack(
                      children: [
                        Align(
                          alignment: const AlignmentDirectional(0, 0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 0, 0, 30),
                                child: Container(
                                  width: 288,
                                  height: 30,
                                  child: Stack(
                                    children: const [
                                      Align(
                                        alignment: AlignmentDirectional(
                                          -1,
                                          0,
                                        ),
                                        child: Text('մուտք գործել',
                                            style: TextStyle(
                                              fontFamily: 'Poppins',
                                              color: Color.fromRGBO(
                                                  127, 127, 127, 1),
                                              fontSize: 18,
                                            )),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 0, 0, 30),
                                child: Container(
                                  width: 288,
                                  height: 40,
                                  child: Stack(
                                    children: [
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(0, 0),
                                        child: TextFormField(
                                          controller: _usernameController,
                                          obscureText: false,
                                          decoration: const InputDecoration(
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00FFFFFF),
                                                width: 2,
                                              ),
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(10.0),
                                              ),
                                            ),
                                            hintText: 'Անուն',
                                            focusedBorder: InputBorder.none,
                                            filled: true,
                                            fillColor: Color.fromRGBO(
                                                235, 235, 232, 1),
                                          ),
                                          style: const TextStyle(
                                            fontFamily: 'Lato',
                                            color: Color.fromRGBO(
                                                169, 169, 169, 1),
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 0, 0, 0),
                                child: Container(
                                  width: 288,
                                  height: 40,
                                  child: Stack(
                                    children: [
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(0, 0),
                                        child: TextFormField(
                                          controller: _passwordController,
                                          obscureText: !passwordVisibility,
                                          decoration: InputDecoration(
                                            hintText: 'Գաղտնաբառ',
                                            enabledBorder:
                                                const UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00FFFFFF),
                                                width: 2,
                                              ),
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(10.0),
                                              ),
                                            ),
                                            focusedBorder:
                                                const UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00FFFFFF),
                                                width: 2,
                                              ),
                                              borderRadius: BorderRadius.only(
                                                topLeft: Radius.circular(4.0),
                                                topRight: Radius.circular(4.0),
                                              ),
                                            ),
                                            filled: true,
                                            fillColor: const Color.fromRGBO(
                                                235, 235, 232, 1),
                                            suffixIcon: InkWell(
                                              onTap: () => setState(
                                                () => passwordVisibility =
                                                    !passwordVisibility,
                                              ),
                                              child: Icon(
                                                passwordVisibility
                                                    ? Icons.visibility_outlined
                                                    : Icons
                                                        .visibility_off_outlined,
                                                size: 22,
                                              ),
                                            ),
                                          ),
                                          style: const TextStyle(
                                            fontFamily: 'Lato',
                                            color: Color.fromRGBO(
                                                169, 169, 169, 1),
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, right: 0),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 1,
                                      child: Row(
                                        children: [
                                          Checkbox(
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5)),
                                            fillColor: MaterialStateProperty
                                                .resolveWith(getColor),
                                            activeColor: const Color.fromARGB(
                                                255, 0, 144, 115),
                                            checkColor: const Color.fromARGB(
                                                255, 0, 144, 115),
                                            value: isChecked,
                                            onChanged: (bool? value) {
                                              setState(() {
                                                isChecked = value!;
                                              });
                                            },
                                          ),
                                          const Text("Հիշել",
                                              style: TextStyle(
                                                fontFamily: 'Poppins',
                                                color: Color.fromRGBO(
                                                    12, 128, 64, 1),
                                                fontSize: 12,
                                              )),
                                        ],
                                      ),
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: TextButton(
                                        onPressed: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      BlocProvider(
                                                        create: (context) => ForgetPasswordBloc(
                                                            authenticationBloc:
                                                                BlocProvider.of<
                                                                        AuthBloc>(
                                                                    context),
                                                            userRepository:
                                                                userRepository),
                                                        child:
                                                            const ForgetPassword(),
                                                      )));
                                        },
                                        child:
                                            const Text("Մոռացե՞լ եք գաղտնաբառը",
                                                style: TextStyle(
                                                  fontFamily: 'Poppins',
                                                  color: Color.fromRGBO(
                                                      12, 128, 64, 1),
                                                  fontSize: 12,
                                                )),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 53, 0, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: const Color.fromRGBO(
                                            12, 128, 64, 1),
                                        onPrimary: Colors.white,

                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0)),
                                        minimumSize:
                                            const Size(160, 40), //////// HERE
                                      ),
                                      onPressed: _onLoginButtonPressed,
                                      child: const Text(
                                        'մուտք',
                                        style: TextStyle(fontSize: 16),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 81,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: const Color.fromRGBO(
                                                183, 183, 183, 1))),
                                  ),
                                  const Padding(
                                    padding:
                                        EdgeInsets.only(left: 15, right: 15),
                                    child: Text(
                                      "Կամ",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color:
                                              Color.fromRGBO(183, 183, 183, 1)),
                                    ),
                                  ),
                                  Container(
                                    width: 81,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: const Color.fromRGBO(
                                                183, 183, 183, 1))),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 40,
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => RegisterScreen(
                                              userRepository: userRepository,
                                            )),
                                  );
                                },
                                child: const Text("Գրանցվել",
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      fontFamily: 'Poppins',
                                      color: Color.fromRGBO(12, 128, 64, 1),
                                      fontSize: 18,
                                    )),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
