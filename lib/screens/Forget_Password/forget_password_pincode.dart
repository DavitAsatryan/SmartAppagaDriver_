import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pin_code_fields/flutter_pin_code_fields.dart';
import 'package:login_register_token/bloc/ForgetPassword_Bloc/bloc/forget_password_bloc.dart';
import 'package:login_register_token/bloc/ForgetPassword_Bloc/bloc/forget_password_new_bloc.dart';
import 'package:login_register_token/bloc/ForgetPassword_Bloc/bloc/pincode_forget_pass_bloc.dart';
import 'package:login_register_token/repository.dart';
import 'package:login_register_token/screens/Forget_Password/forget_password_new.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';

import '../../bloc/Auth_Bloc/bloc/auth_bloc.dart';

class ForgetPasswordPinCode extends StatefulWidget {
  const ForgetPasswordPinCode({Key? key}) : super(key: key);

  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPasswordPinCode> {
  _onPinCodeButtonPressed(String pinCode) {
    print("pinCode $pinCode");
    BlocProvider.of<PincodeForgetPassBloc>(context).add(
      ButtonPinCode(
        pinCodeText: pinCode,
      ),
    );
  }

  TextEditingController _pinCode = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  String currentText = "";
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PincodeForgetPassBloc, PincodeForgetPassState>(
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
                      image: AssetImage("assets/forgot pasvord 2.png"),
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
                                  width: 310,
                                  height: 150,
                                  child: Stack(
                                    children: const [
                                      Align(
                                        alignment: AlignmentDirectional(
                                          -1,
                                          0,
                                        ),
                                        child: Text(
                                            'Խնդրում ենք \nմուտքագրել 6 նիշանոց կոդը, որն ուղղարկվել է ձեր գրանցված բջջային համարին',
                                            style: TextStyle(
                                              fontFamily: 'Poppins',
                                              color:
                                                  Color.fromRGBO(47, 48, 43, 1),
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
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: Color.fromRGBO(235, 235, 232, 1),
                                  ),
                                  width: 288,
                                  height: 210,
                                  child: Column(
                                    children: [
                                      const SizedBox(
                                        height: 30,
                                      ),
                                      Stack(
                                        children: [
                                          Align(
                                              alignment:
                                                  const AlignmentDirectional(
                                                      0, 0),
                                              child: PinCodeTextField(
                                                defaultBorderColor:
                                                    const Color.fromRGBO(
                                                        255, 255, 255, 1),
                                                hasTextBorderColor:
                                                    const Color.fromRGBO(
                                                        255, 255, 255, 1),
                                                controller: _pinCode,
                                                onTextChanged: (value) {
                                                  print(value);
                                                  setState(() {
                                                    currentText = value;
                                                  });
                                                },
                                                pinBoxRadius: 8,
                                                pinBoxWidth: 38,
                                                pinBoxHeight: 40,
                                                maxLength: 6,
                                                keyboardType:
                                                    TextInputType.number,
                                              ))
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(0, 29, 0, 0),
                                        child: Container(
                                          width: 214,
                                          height: 40,
                                          child: Stack(
                                            children: [
                                              Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          0, 0),
                                                  child: ElevatedButton(
                                                    style: ElevatedButton
                                                        .styleFrom(
                                                      primary:
                                                          const Color.fromRGBO(
                                                              12, 128, 64, 1),
                                                      onPrimary: Colors.white,

                                                      shape:
                                                          RoundedRectangleBorder(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10.0)),
                                                      minimumSize: const Size(
                                                          214,
                                                          40), //////// HERE
                                                    ),
                                                    onPressed: () {
                                                      _onPinCodeButtonPressed(
                                                          _pinCode.text);
                                                      Navigator.of(context).push(
                                                          MaterialPageRoute(
                                                              builder:
                                                                  (context) =>
                                                                      BlocProvider(
                                                                        create: (context) => ForgetPasswordNewBloc(
                                                                            authenticationBloc:
                                                                                BlocProvider.of<AuthBloc>(context),
                                                                            userRepository: UserRepository()),
                                                                        child:
                                                                            const ForgetPasswordNew(),
                                                                      )));
                                                    },
                                                    child: const Text(
                                                      'Շարունակել',
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          color: Color.fromRGBO(
                                                              240,
                                                              240,
                                                              240,
                                                              1)),
                                                    ),
                                                  )),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsetsDirectional
                                            .fromSTEB(0, 23, 0, 0),
                                        child: Container(
                                          width: 260,
                                          height: 35,
                                          child: Stack(
                                            children: [
                                              Align(
                                                  alignment:
                                                      const AlignmentDirectional(
                                                          0, 0),
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      const Text(
                                                          "Կոդ չե՞ք ստացել:",
                                                          style: TextStyle(
                                                            fontFamily:
                                                                'Poppins',
                                                            color:
                                                                Color.fromRGBO(
                                                                    47,
                                                                    48,
                                                                    43,
                                                                    1),
                                                            fontSize: 14,
                                                          )),
                                                      TextButton(
                                                          onPressed: () {
                                                            if (state
                                                                is ButtonPinCode) {
                                                              Navigator.of(context).push(
                                                                  MaterialPageRoute(
                                                                      builder: (context) =>
                                                                          BlocProvider(
                                                                            create: (context) =>
                                                                                PincodeForgetPassBloc(authenticationBloc: BlocProvider.of<AuthBloc>(context), userRepository: UserRepository()),
                                                                            child:
                                                                                const ForgetPasswordNew(),
                                                                          )));
                                                            }
                                                          },
                                                          child: const Text(
                                                            "Ուղղարկել կրկին",
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'Poppins',
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      0,
                                                                      144,
                                                                      115),
                                                              fontSize: 14,
                                                            ),
                                                          ))
                                                    ],
                                                  )),
                                            ],
                                          ),
                                        ),
                                      ),
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
