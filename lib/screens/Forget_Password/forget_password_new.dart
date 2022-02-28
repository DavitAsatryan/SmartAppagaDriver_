import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_register_token/bloc/ForgetPassword_Bloc/bloc/forget_password_new_bloc.dart';
import 'package:login_register_token/repository.dart';
import 'package:login_register_token/screens/login_screen.dart';

import 'forget_password_pincode.dart';

class ForgetPasswordNew extends StatefulWidget {
  const ForgetPasswordNew({Key? key}) : super(key: key);

  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPasswordNew> {
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  bool passwordVisibility = false;
  bool passwordVisibilityTwo = false;
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _passwordTwoController = TextEditingController();

  _onPasswordNewButtonPressed(String password, String passwordTwo) {
    print("$password, $passwordTwo");
    BlocProvider.of<ForgetPasswordNewBloc>(context).add(
      ButtonForgetPasswordNew(
          passwordText: password, passwordTwoText: passwordTwo),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForgetPasswordNewBloc, ForgetPasswordNewState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.only(right: 0, left: 0, top: 0, bottom: 0),
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
                      image: AssetImage("assets/forgot pasvord 3.png"),
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
                                    0, 0, 0, 10),
                                child: Container(
                                  width: 288,
                                  height: 29,
                                  child: Stack(
                                    children: const [
                                      Align(
                                        alignment: AlignmentDirectional(
                                          -1,
                                          0,
                                        ),
                                        child: Text('Նոր գաղտնաբառ',
                                            style: TextStyle(
                                              fontFamily: 'Poppins',
                                              color:
                                                  Color.fromRGBO(47, 48, 43, 1),
                                              fontSize: 22,
                                            )),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 40, 0, 0),
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
                                            hintText: 'Նոր գաղտնաբառ',
                                            enabledBorder:
                                                const UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color.fromRGBO(
                                                    235, 235, 232, 1),
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
                                            ),
                                            filled: true,
                                            fillColor: const Color(0xFFEBECE7),
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
                                                183, 183, 183, 1),
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
                                    0, 39, 0, 0),
                                child: Container(
                                  width: 288,
                                  height: 40,
                                  child: Stack(
                                    children: [
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(0, 0),
                                        child: TextFormField(
                                          controller: _passwordTwoController,
                                          obscureText: !passwordVisibilityTwo,
                                          decoration: InputDecoration(
                                            hintText: 'Կրկնել նոր Գաղտնաբառը',
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
                                            ),
                                            filled: true,
                                            fillColor: Color(0xFFEBECE7),
                                            suffixIcon: InkWell(
                                              onTap: () => setState(
                                                () => passwordVisibilityTwo =
                                                    !passwordVisibilityTwo,
                                              ),
                                              child: Icon(
                                                passwordVisibilityTwo
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
                                                183, 183, 183, 1),
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
                                    0, 47, 0, 0),
                                child: Container(
                                  width: 214,
                                  height: 40,
                                  child: Stack(
                                    children: [
                                      Align(
                                          alignment:
                                              const AlignmentDirectional(0, 0),
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              primary: const Color.fromRGBO(
                                                  12, 128, 64, 1),
                                              onPrimary: Colors.white,

                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10.0)),
                                              minimumSize: const Size(
                                                  214, 40), //////// HERE
                                            ),
                                            onPressed: () {
                                              _onPasswordNewButtonPressed(
                                                  _passwordController.text,
                                                  _passwordTwoController.text);

                                              Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          LoginScreen(
                                                            userRepository:
                                                                UserRepository(),
                                                          )));

                                              // if (state
                                              //     is ButtonPhoneNumber) {
                                              //   Navigator.of(context).push(
                                              //       MaterialPageRoute(
                                              //           builder:
                                              //               (context) =>
                                              //                   BlocProvider(
                                              //                     create: (context) => PincodeForgetPassBloc(
                                              //                         authenticationBloc:
                                              //                             BlocProvider.of<AuthBloc>(context),
                                              //                         userRepository: UserRepository()),
                                              //                     child:
                                              //                         ForgetPasswordPinCode(),
                                              //                   )));
                                              // }
                                            },
                                            child: const Text(
                                              'Հաստատել',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Color.fromRGBO(
                                                      240, 240, 240, 1)),
                                            ),
                                          )),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  )),
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
                            fontSize: 12,
                            color: Color.fromRGBO(65, 132, 130, 1)),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 4),
                      child: Text(
                        "Privacy Policy",
                        style: TextStyle(
                            fontSize: 12,
                            color: Color.fromRGBO(65, 132, 130, 1)),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
