import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_register_token/screens/login_screen.dart';
//import 'package:login_register_token/screens/Menu/drawerMenu.dart';

import '../bloc/Register_bloc/register_bloc.dart';
import '../repository.dart';

class RegisterForm extends StatefulWidget {
  final UserRepository userRepository;
  RegisterForm({Key? key, required this.userRepository}) : super(key: key);

  @override
  State<RegisterForm> createState() => _RegisterFormState(userRepository);
}

class _RegisterFormState extends State<RegisterForm> {
  final UserRepository userRepository;
  _RegisterFormState(this.userRepository);

  final _fullNameController = TextEditingController(text: "Davit Asatryan");
  final _phoneNumberController = TextEditingController(text: "077383634");
  final _carNumberController = TextEditingController(text: "46 SD 152");
  final _carNameController = TextEditingController(text: "Nissan Skyline");
  final _carColorController = TextEditingController(text: "Black");
  final _passwordController = TextEditingController(text: "application..");
  final _passwordTwoController = TextEditingController(text: "application..");
  bool sendBoolData = false;

  bool passwordVisibility = false;
  bool isCheckedOne = false;
  bool isCheckedTwo = false;
  bool isCheckedThree = false;
  bool isCheckedFour = false;
  @override
  Widget build(BuildContext context) {
    Widget okButton = TextButton(
      child: Container(
        width: double.infinity,
        height: 40,
        decoration: const BoxDecoration(
            border: Border(
          top:
              BorderSide(width: 1.0, color: Color.fromARGB(255, 229, 238, 243)),
        )),
        child: const Center(
          child: Text(
            "Լավ",
            style: TextStyle(
              fontFamily: 'Poppins',
              color: Color.fromARGB(202, 150, 179, 47),
              fontSize: 15,
            ),
          ),
        ),
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );
    AlertDialog alert = AlertDialog(
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Color.fromARGB(255, 144, 138, 137)),
        borderRadius: BorderRadius.circular(20),
      ),
      actions: [okButton],
      content: const Text(
          "Շնորհակալություն ձեր դիմումը ընդունվել է: Մենք ձեզ հետ կապ կհաստատենք 2 աշխատանքային օրվա ընդացքում:"),
    );
    _onLoginButtonPressed() {
      print("object");
      BlocProvider.of<RegisterBloc>(context).add(RegisternButtonPressed(
        email: _carNumberController.text,
        password: _passwordController.text,
        fullname: _fullNameController.text,
        phoneNumber: _phoneNumberController.text,
      ));
    }

    setState(() {
      if (isCheckedOne == true) {
        // isCheckedTwo = false;
        // isCheckedThree = false;
        // isCheckedFour = false;
        sendBoolData = isCheckedOne;
        print("one $sendBoolData");
      } else if (isCheckedTwo == true) {
        // isCheckedOne = false;
        // isCheckedThree = false;
        // isCheckedFour = false;
        sendBoolData = isCheckedTwo;
        print("two $sendBoolData");
      } else if (isCheckedThree == true) {
        // isCheckedOne = false;
        // isCheckedTwo = false;
        // isCheckedFour = false;
        sendBoolData = isCheckedThree;
        print("three $sendBoolData");
      } else if (isCheckedFour == true) {
        // isCheckedOne = false;
        // isCheckedTwo = false;
        // isCheckedThree = false;
        sendBoolData = isCheckedFour;
        print("four $sendBoolData");
      }
    });

    return BlocListener<RegisterBloc, RegisterState>(
      listener: (context, state) {
        if (state is RegisternButtonPressed) {
          showDialog(
              barrierColor: const Color.fromARGB(218, 226, 222, 211),
              context: context,
              builder: (context) {
                return alert;
              });
        }
        if (state is RegisterFailure) {
          Scaffold.of(context).showSnackBar(
            const SnackBar(
              content: Text("Register failed."),
              backgroundColor: Colors.red,
            ),
          );
        }
        //  if (state is ) {
        //   Scaffold.of(context).showSnackBar(
        //     SnackBar(
        //       content: Text("Register failed."),
        //       backgroundColor: Colors.red,
        //     ),
        //   );
        // }
      },
      child: BlocBuilder<RegisterBloc, RegisterState>(
        builder: (context, state) {
          Color getColor(Set<MaterialState> states) {
            const Set<MaterialState> interactiveStates = <MaterialState>{
              //  MaterialState.pressed,
              //MaterialState.hovered,
              //MaterialState.focused,
              MaterialState.selected
            };
            // if (states.any(interactiveStates.contains)) {
            //   return Color.fromARGB(0, 217, 31, 31);
            // }
            return const Color(0xFFA7A7A7);
          }

          return SingleChildScrollView(
            child: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("assets/Registration.png"),
                fit: BoxFit.cover,
              )),
              width: double.infinity,
              // height: double.infinity,
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(0, 34, 0, 0),
                    child: Container(
                      width: 350,
                      height: 50,
                      child: Stack(
                        children: [
                          Align(
                            alignment: const AlignmentDirectional(
                              1,
                              0,
                            ),
                            child: TextButton(
                              child: const Text(
                                "Մուտք",
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  color: Color.fromRGBO(232, 232, 232, 1),
                                  fontSize: 18,
                                  decoration: TextDecoration.underline,
                                  decorationThickness: 2.5,
                                ),
                              ),
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => LoginScreen(
                                        userRepository: userRepository)));
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                      alignment: const AlignmentDirectional(0, 0),
                      child: Padding(
                          padding: const EdgeInsets.only(top: 100),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 0, 0, 24),
                                child: Container(
                                  width: 288,
                                  height: 40,
                                  child: Stack(
                                    children: const [
                                      Align(
                                        alignment: AlignmentDirectional(
                                          -1,
                                          0,
                                        ),
                                        child: Text('Գրանցվել',
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
                                    0, 0, 0, 24),
                                child: Container(
                                  width: 288,
                                  height: 40,
                                  child: Stack(
                                    children: [
                                      Align(
                                          alignment: const AlignmentDirectional(
                                            -1,
                                            0,
                                          ),
                                          child: RichText(
                                            text: TextSpan(
                                              children: [
                                                TextSpan(
                                                  text: 'Առաջարկվող պայմանները',
                                                  style: const TextStyle(
                                                      color: Color.fromRGBO(
                                                          65, 132, 130, 1)),
                                                  recognizer:
                                                      TapGestureRecognizer()
                                                        ..onTap = () {
                                                          ('https://docs.flutter.io/flutter/services/UrlLauncher-class.html');
                                                        },
                                                ),
                                              ],
                                            ),
                                          )),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 0, 0, 24),
                                child: Container(
                                  width: 288,
                                  height: 40,
                                  child: Stack(
                                    children: const [
                                      Align(
                                        alignment: AlignmentDirectional(
                                          -1,
                                          0,
                                        ),
                                        child: Text('Անձնական տվեալներ',
                                            style: TextStyle(
                                              fontFamily: 'Poppins',
                                              color: Color.fromRGBO(0, 0, 0, 1),
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
                                          style: const TextStyle(
                                            fontFamily: 'Lato',
                                            color: Color.fromRGBO(
                                                169, 169, 169, 1),
                                            fontSize: 16,
                                          ),
                                          controller: _fullNameController,
                                          obscureText: false,
                                          decoration: const InputDecoration(
                                            border: OutlineInputBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(22))),
                                            hintText: 'Անուն Ազգանուն',
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00FFFFFF),
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
                                                color: Color(0x00FFFFFF),
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
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 24),
                                child: Container(
                                  width: 288,
                                  height: 50,
                                  child: Stack(
                                    children: const [
                                      Align(
                                        alignment: AlignmentDirectional(
                                          -1,
                                          0,
                                        ),
                                        child: Text('Մեքենայի տվեալներ',
                                            style: TextStyle(
                                              fontFamily: 'Poppins',
                                              color: Color.fromRGBO(0, 0, 0, 1),
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
                                  height: 50,
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
                                          controller: _carNumberController,
                                          obscureText: false,
                                          decoration: const InputDecoration(
                                            hintText: 'Մեքենայի Համարանիշ',
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00FFFFFF),
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
                                    0, 0, 0, 30),
                                child: Container(
                                  width: 288,
                                  height: 50,
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
                                          controller: _carNameController,
                                          obscureText: false,
                                          decoration: const InputDecoration(
                                            hintText: 'Մեքենայի Մակնիշ',
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Color(0x00FFFFFF),
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
                                    0, 0, 0, 30),
                                child: Container(
                                  width: 288,
                                  height: 50,
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
                                          controller: _carColorController,
                                          obscureText: false,
                                          decoration: const InputDecoration(
                                            hintText: 'Մեքենայի Գույն',
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
                                            fillColor: Color(0xFFEBECE7),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              //dddd
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 0, 0, 30),
                                child: Container(
                                  width: 288,
                                  height: 242,
                                  child: Stack(
                                    children: [
                                      Align(
                                        alignment:
                                            const AlignmentDirectional(-1, 0),
                                        child: Container(
                                          width: 310,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: const Color.fromRGBO(
                                                235, 235, 232, 1),
                                          ),
                                          height: 400,
                                          child: Column(
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(0, 11, 0, 0),
                                                child: Container(
                                                  width: 288,
                                                  height: 20,
                                                  child: Stack(
                                                    children: const [
                                                      Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                          -1,
                                                          0,
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 11),
                                                          child: Text(
                                                              'Մեքենայի Տարողությունը',
                                                              style: TextStyle(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: Color
                                                                    .fromRGBO(
                                                                        183,
                                                                        183,
                                                                        183,
                                                                        1),
                                                                fontSize: 16,
                                                              )),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(0, 22, 0, 0),
                                                child: Container(
                                                  width: 310,
                                                  height: 20,
                                                  child: Stack(
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                0, 0),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                  0, 0, 0, 0),
                                                          child: Container(
                                                            width: 288,
                                                            height: 20,
                                                            child: Stack(
                                                              children: [
                                                                Align(
                                                                  alignment:
                                                                      const AlignmentDirectional(
                                                                          0, 0),
                                                                  child: Row(
                                                                    children: [
                                                                      Checkbox(
                                                                        shape: RoundedRectangleBorder(
                                                                            borderRadius:
                                                                                BorderRadius.circular(10)),
                                                                        fillColor:
                                                                            MaterialStateProperty.resolveWith(getColor),
                                                                        checkColor: const Color.fromARGB(
                                                                            255,
                                                                            0,
                                                                            144,
                                                                            115),
                                                                        value:
                                                                            isCheckedOne,
                                                                        onChanged:
                                                                            (bool?
                                                                                value) {
                                                                          setState(
                                                                              () {
                                                                            isCheckedOne =
                                                                                value!;
                                                                            isCheckedTwo =
                                                                                false;
                                                                            isCheckedThree =
                                                                                false;
                                                                            isCheckedFour =
                                                                                false;
                                                                          });
                                                                        },
                                                                      ),
                                                                      const Text(
                                                                          "100 - 300",
                                                                          style:
                                                                              TextStyle(
                                                                            fontFamily:
                                                                                'Poppins',
                                                                            color: Color.fromRGBO(
                                                                                167,
                                                                                166,
                                                                                166,
                                                                                1),
                                                                            fontSize:
                                                                                16,
                                                                          )),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(0, 27, 0, 0),
                                                child: Container(
                                                  width: 310,
                                                  height: 20,
                                                  child: Stack(
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                0, 0),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                  0, 0, 0, 0),
                                                          child: Container(
                                                            width: 288,
                                                            height: 20,
                                                            child: Stack(
                                                              children: [
                                                                Align(
                                                                  alignment:
                                                                      const AlignmentDirectional(
                                                                          0, 0),
                                                                  child: Row(
                                                                    children: [
                                                                      Checkbox(
                                                                        shape: RoundedRectangleBorder(
                                                                            borderRadius: BorderRadius.circular(10),
                                                                            side: const BorderSide(
                                                                              width: 1,
                                                                              color: const Color.fromARGB(202, 150, 179, 47),
                                                                            )),
                                                                        fillColor:
                                                                            MaterialStateProperty.resolveWith(getColor),
                                                                        checkColor: const Color.fromARGB(
                                                                            255,
                                                                            0,
                                                                            144,
                                                                            115),
                                                                        value:
                                                                            isCheckedTwo,
                                                                        onChanged:
                                                                            (bool?
                                                                                value) {
                                                                          setState(
                                                                              () {
                                                                            isCheckedTwo =
                                                                                value!;
                                                                            isCheckedFour =
                                                                                false;
                                                                            isCheckedThree =
                                                                                false;
                                                                            isCheckedOne =
                                                                                false;
                                                                          });
                                                                        },
                                                                      ),
                                                                      const Text(
                                                                          "300 - 500",
                                                                          style:
                                                                              TextStyle(
                                                                            fontFamily:
                                                                                'Poppins',
                                                                            color: Color.fromRGBO(
                                                                                167,
                                                                                166,
                                                                                166,
                                                                                1),
                                                                            fontSize:
                                                                                16,
                                                                          )),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(0, 27, 0, 0),
                                                child: Container(
                                                  width: 288,
                                                  height: 20,
                                                  child: Stack(
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                0, 0),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                  0, 0, 0, 0),
                                                          child: Container(
                                                            width: 288,
                                                            height: 20,
                                                            child: Stack(
                                                              children: [
                                                                Align(
                                                                  alignment:
                                                                      const AlignmentDirectional(
                                                                          0, 0),
                                                                  child: Row(
                                                                    children: [
                                                                      Checkbox(
                                                                        shape: RoundedRectangleBorder(
                                                                            borderRadius:
                                                                                BorderRadius.circular(10)),
                                                                        fillColor:
                                                                            MaterialStateProperty.resolveWith(getColor),
                                                                        checkColor: const Color.fromARGB(
                                                                            255,
                                                                            0,
                                                                            144,
                                                                            115),
                                                                        value:
                                                                            isCheckedThree,
                                                                        onChanged:
                                                                            (bool?
                                                                                value) {
                                                                          setState(
                                                                              () {
                                                                            isCheckedThree =
                                                                                value!;
                                                                            isCheckedOne =
                                                                                false;
                                                                            isCheckedTwo =
                                                                                false;
                                                                            isCheckedFour =
                                                                                false;
                                                                          });
                                                                        },
                                                                      ),
                                                                      const Text(
                                                                          "500 - 800",
                                                                          style:
                                                                              TextStyle(
                                                                            fontFamily:
                                                                                'Poppins',
                                                                            color: Color.fromRGBO(
                                                                                167,
                                                                                166,
                                                                                166,
                                                                                1),
                                                                            fontSize:
                                                                                16,
                                                                          )),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsetsDirectional
                                                        .fromSTEB(0, 27, 0, 0),
                                                child: Container(
                                                  width: 288,
                                                  height: 20,
                                                  child: Stack(
                                                    children: [
                                                      Align(
                                                        alignment:
                                                            const AlignmentDirectional(
                                                                0, 0),
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                  0, 0, 0, 0),
                                                          child: Container(
                                                            width: 288,
                                                            height: 20,
                                                            child: Stack(
                                                              children: [
                                                                Align(
                                                                  alignment:
                                                                      const AlignmentDirectional(
                                                                          0, 0),
                                                                  child: Row(
                                                                    children: [
                                                                      Checkbox(
                                                                        shape: RoundedRectangleBorder(
                                                                            borderRadius:
                                                                                BorderRadius.circular(10)),
                                                                        fillColor:
                                                                            MaterialStateProperty.resolveWith(getColor),
                                                                        checkColor: const Color.fromARGB(
                                                                            255,
                                                                            0,
                                                                            144,
                                                                            115),
                                                                        value:
                                                                            isCheckedFour,
                                                                        onChanged:
                                                                            (bool?
                                                                                value) {
                                                                          setState(
                                                                              () {
                                                                            isCheckedFour =
                                                                                value!;
                                                                            isCheckedOne =
                                                                                false;
                                                                            isCheckedTwo =
                                                                                false;
                                                                            isCheckedThree =
                                                                                false;
                                                                          });
                                                                        },
                                                                      ),
                                                                      const Text(
                                                                          "1000 և ավել",
                                                                          style:
                                                                              TextStyle(
                                                                            fontFamily:
                                                                                'Poppins',
                                                                            color: Color.fromRGBO(
                                                                                167,
                                                                                166,
                                                                                166,
                                                                                1),
                                                                            fontSize:
                                                                                16,
                                                                          )),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
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
                                  height: 22,
                                  child: Stack(
                                    children: const [
                                      Align(
                                        alignment: AlignmentDirectional(
                                          -1,
                                          0,
                                        ),
                                        child: Text('Գաղտնաբառ',
                                            style: TextStyle(
                                              fontFamily: 'Poppins',
                                              color: Color.fromRGBO(0, 0, 0, 1),
                                              fontSize: 18,
                                            )),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    0, 0, 0, 24),
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
                                            fillColor: Color(0xFFEBECE7),
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
                                            color: Color(0xFF757575),
                                            fontSize: 18,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                        primary: Color.fromRGBO(12, 128, 64, 1),

                                        elevation: 3,
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10.0)),
                                        minimumSize:
                                            Size(242, 40), //////// HERE
                                      ),
                                      onPressed: _onLoginButtonPressed,
                                      child: Text('Ուղղարկել դիմում',
                                          style: TextStyle(
                                            fontFamily: 'Poppins',
                                            color: Color.fromRGBO(
                                                255, 255, 255, 1),
                                            fontSize: 16,
                                          )),
                                    )
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 50,
                              ),
                              Container(
                                decoration: BoxDecoration(
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
                                      padding: const EdgeInsets.only(
                                          right: 10, top: 4),
                                      child: Text(
                                        "Terms of Use",
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Color.fromRGBO(
                                                65, 132, 130, 1)),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top: 4),
                                      child: Text(
                                        "Privacy Policy",
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: Color.fromRGBO(
                                                65, 132, 130, 1)),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          )))
                ],
              ),
            ),
          );
          // return Padding(
          //   padding: const EdgeInsets.only(right: 20.0, left: 20.0, top: 80.0),
          //   child: Form(
          //     child: Column(
          //       children: [
          //         Container(
          //             height: 200.0,
          //             padding: EdgeInsets.only(bottom: 20.0, top: 40.0),
          //             child: Column(
          //               mainAxisAlignment: MainAxisAlignment.center,
          //               children: [
          //                 Text(
          //                   "Registration",
          //                   style: TextStyle(
          //                       fontWeight: FontWeight.bold, fontSize: 24.0),
          //                 ),
          //                 SizedBox(
          //                   height: 5.0,
          //                 ),
          //               ],
          //             )),
          //         TextFormField(
          //           style:
          //               TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
          //           controller: _fullNameController,
          //           decoration: InputDecoration(
          //             enabledBorder: OutlineInputBorder(
          //                 borderSide: new BorderSide(color: Colors.black12),
          //                 borderRadius: BorderRadius.circular(30.0)),
          //             focusedBorder: OutlineInputBorder(
          //                 borderSide: new BorderSide(color: Colors.black),
          //                 borderRadius: BorderRadius.circular(30.0)),
          //             contentPadding: EdgeInsets.only(left: 10.0, right: 10.0),
          //             labelText: "Full Name",
          //             hintStyle: TextStyle(
          //                 fontSize: 12.0, fontWeight: FontWeight.w500),
          //             labelStyle: TextStyle(
          //                 fontSize: 12.0,
          //                 color: Colors.grey,
          //                 fontWeight: FontWeight.w500),
          //           ),
          //           autocorrect: false,
          //         ),
          //         SizedBox(
          //           height: 30.0,
          //         ),
          //         TextFormField(
          //           keyboardType: TextInputType.number,
          //           style:
          //               TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
          //           controller: _phoneNumberController,
          //           decoration: InputDecoration(
          //             enabledBorder: OutlineInputBorder(
          //                 borderSide: new BorderSide(color: Colors.black12),
          //                 borderRadius: BorderRadius.circular(30.0)),
          //             focusedBorder: OutlineInputBorder(
          //                 borderSide: new BorderSide(color: Colors.black),
          //                 borderRadius: BorderRadius.circular(30.0)),
          //             contentPadding: EdgeInsets.only(left: 10.0, right: 10.0),
          //             labelText: "Phone Number",
          //             hintStyle: TextStyle(
          //                 fontSize: 12.0, fontWeight: FontWeight.w500),
          //             labelStyle: TextStyle(
          //                 fontSize: 12.0,
          //                 color: Colors.grey,
          //                 fontWeight: FontWeight.w500),
          //           ),
          //           autocorrect: false,
          //         ),
          //         SizedBox(
          //           height: 30.0,
          //         ),
          //         TextFormField(
          //           style:
          //               TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
          //           controller: _usernameController,
          //           keyboardType: TextInputType.emailAddress,
          //           decoration: InputDecoration(
          //             prefixIcon:
          //                 Icon(Icons.email_outlined, color: Colors.black26),
          //             enabledBorder: OutlineInputBorder(
          //                 borderSide: new BorderSide(color: Colors.black12),
          //                 borderRadius: BorderRadius.circular(30.0)),
          //             focusedBorder: OutlineInputBorder(
          //                 borderSide: new BorderSide(color: Colors.black),
          //                 borderRadius: BorderRadius.circular(30.0)),
          //             contentPadding: EdgeInsets.only(left: 10.0, right: 10.0),
          //             labelText: "E-Mail",
          //             hintStyle: TextStyle(
          //                 fontSize: 12.0, fontWeight: FontWeight.w500),
          //             labelStyle: TextStyle(
          //                 fontSize: 12.0,
          //                 color: Colors.grey,
          //                 fontWeight: FontWeight.w500),
          //           ),
          //           autocorrect: false,
          //         ),
          //         SizedBox(
          //           height: 20.0,
          //         ),
          //         TextFormField(
          //           style:
          //               TextStyle(fontSize: 14.0, fontWeight: FontWeight.bold),
          //           controller: _passwordController,
          //           decoration: InputDecoration(
          //             fillColor: Colors.white,
          //             prefixIcon: Icon(
          //               Icons.lock_clock_outlined,
          //               color: Colors.black26,
          //             ),
          //             enabledBorder: OutlineInputBorder(
          //                 borderSide: new BorderSide(color: Colors.black12),
          //                 borderRadius: BorderRadius.circular(30.0)),
          //             focusedBorder: OutlineInputBorder(
          //                 borderSide: new BorderSide(color: Colors.black),
          //                 borderRadius: BorderRadius.circular(30.0)),
          //             contentPadding: EdgeInsets.only(left: 10.0, right: 10.0),
          //             labelText: "Password",
          //             hintStyle: TextStyle(
          //                 fontSize: 12.0, fontWeight: FontWeight.w500),
          //             labelStyle: TextStyle(
          //                 fontSize: 12.0,
          //                 color: Colors.grey,
          //                 fontWeight: FontWeight.w500),
          //           ),
          //           autocorrect: false,
          //           obscureText: true,
          //         ),
          //         SizedBox(
          //           height: 30.0,
          //         ),
          //         Padding(
          //           padding: EdgeInsets.only(top: 30.0, bottom: 20.0),
          //           child: Column(
          //             crossAxisAlignment: CrossAxisAlignment.stretch,
          //             children: <Widget>[
          //               SizedBox(
          //                   height: 45,
          //                   child: state is RegisterLoading
          //                       ? Column(
          //                           crossAxisAlignment:
          //                               CrossAxisAlignment.center,
          //                           mainAxisAlignment: MainAxisAlignment.center,
          //                           children: <Widget>[
          //                             Center(
          //                                 child: Column(
          //                               mainAxisAlignment:
          //                                   MainAxisAlignment.center,
          //                               children: [
          //                                 SizedBox(
          //                                   height: 25.0,
          //                                   width: 25.0,
          //                                   child: CupertinoActivityIndicator(),
          //                                 )
          //                               ],
          //                             ))
          //                           ],
          //                         )
          //                       : RaisedButton(
          //                           disabledTextColor: Colors.white,
          //                           shape: RoundedRectangleBorder(
          //                             borderRadius: BorderRadius.circular(30.0),
          //                           ),
          //                           onPressed: _onLoginButtonPressed,
          //                           child: Text("Register",
          //                               style: new TextStyle(
          //                                   fontSize: 12.0,
          //                                   fontWeight: FontWeight.bold,
          //                                   color: Colors.white)))),
          //             ],
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // );
        },
      ),
    );
  }
}
