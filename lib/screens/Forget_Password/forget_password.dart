import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:http/http.dart' as http;
import 'package:login_register_token/bloc/ForgetPassword_Bloc/bloc/forget_password_bloc.dart';
import 'package:login_register_token/bloc/ForgetPassword_Bloc/bloc/pincode_forget_pass_bloc.dart';
import 'package:login_register_token/repository.dart';
import '../../bloc/Auth_Bloc/bloc/auth_bloc.dart';
import 'forget_password_pincode.dart';

String base_url = 'https://phpstack-351614-1150808.cloudwaysapps.com';
var api_url = base_url + '/api/customer';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  TextEditingController _phoneNumberController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  _onPhoneNumberButtonPressed(String number) {
    print(number);
    BlocProvider.of<ForgetPasswordBloc>(context).add(
      ButtonPhoneNumber(
        phoneNumberText: number,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ForgetPasswordBloc, ForgetPasswordState>(
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
                      image: AssetImage("assets/forgot pasvord.png"),
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
                                    0, 0, 0, 31),
                                child: Container(
                                  width: 288,
                                  height: 60,
                                  child: Stack(
                                    children: const [
                                      Align(
                                        alignment: AlignmentDirectional(
                                          -1,
                                          0,
                                        ),
                                        child: Text('Մոռացել եք \nգաղտնաբառը',
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
                                    0, 0, 0, 10),
                                child: Container(
                                  width: 288,
                                  height: 60,
                                  child: Stack(
                                    children: const [
                                      Align(
                                        alignment: AlignmentDirectional(
                                          -1,
                                          0,
                                        ),
                                        child: Text(
                                            'Մուտքագրեք ձեր հաշվում նշված հերախոսահամարը',
                                            style: TextStyle(
                                              fontFamily: 'Poppins',
                                              color: Color.fromRGBO(
                                                  162, 160, 160, 1),
                                              fontSize: 17,
                                            )),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 0, 0, 37),
                                child: Container(
                                  width: 288,
                                  height: 40,
                                  child: Stack(
                                    children: [
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(0, 0),
                                        child: TextFormField(
                                          style: const TextStyle(
                                            fontFamily: 'Lato',
                                            color: Color.fromRGBO(
                                                169, 169, 169, 1),
                                            fontSize: 16,
                                          ),
                                          keyboardType: TextInputType.phone,
                                          controller: _phoneNumberController,
                                          obscureText: false,
                                          decoration: const InputDecoration(
                                            hintText: 'Հեռախոսահամար',
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color.fromRGBO(
                                                    235, 235, 232, 1),
                                                width: 2,
                                              ),
                                              borderRadius: BorderRadius.all(
                                                Radius.circular(10.0),
                                              ),
                                            ),
                                            focusedBorder: InputBorder.none,
                                            filled: true,
                                            fillColor: Color.fromRGBO(
                                                235, 235, 232, 1),
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
                                                Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder:
                                                            (context) =>
                                                                BlocProvider(
                                                                  create: (context) => PincodeForgetPassBloc(
                                                                      authenticationBloc:
                                                                          BlocProvider.of<AuthBloc>(
                                                                              context),
                                                                      userRepository:
                                                                          UserRepository()),
                                                                  child:
                                                                      const ForgetPasswordPinCode(),
                                                                )));
                                                _onPhoneNumberButtonPressed(
                                                    _phoneNumberController
                                                        .text);
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
                                                'Վերականգնել',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Color.fromRGBO(
                                                        240, 240, 240, 1)),
                                              ))),
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
