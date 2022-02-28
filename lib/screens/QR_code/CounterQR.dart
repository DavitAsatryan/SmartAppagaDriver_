import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:login_register_token/Cubit/cubit/bool_cubit.dart';
import 'package:login_register_token/bloc/QRCounterAndReason/bloc/qr_counter_reason_bloc.dart';
import 'package:login_register_token/screens/Menu/Home/Home.dart';
import 'package:login_register_token/screens/Menu/Profile/profile.dart';

class CounterQR extends StatefulWidget {
  int counter;
  CounterQR({Key? key, required this.counter}) : super(key: key);

  @override
  _CounterQRState createState() => _CounterQRState(counter: counter);
}

class _CounterQRState extends State<CounterQR> {
  _CounterQRState({required this.counter});
  int counter;
  TextEditingController _controller = TextEditingController();

  _onQRCounterAndReasonButtonPressed() {
    BlocProvider.of<QrCounterReasonBloc>(context).add(
      QrCounterReasonButtonPressed(
        checkbox: isCheckedOne == true
            ? "Թափոնը մաքուր էր"
            : isCheckedTwo == true
                ? "Թափոնը մաքուր չէր"
                : "",
        counter: "$counter",
        reason: "${_controller.text}",
      ),
    );
  }

  bool isCheckedOne = false;
  bool isCheckedTwo = false;
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
        return Colors.blue;
      }
      return Color.fromRGBO(12, 128, 64, 1);
    }

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Scrollbar(
          child: Padding(
            padding: const EdgeInsets.only(),
            child: Container(
              decoration:
                  BoxDecoration(color: Color.fromRGBO(255, 255, 255, 1)),
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16),
                child: Container(
                  decoration:
                      BoxDecoration(color: Color.fromRGBO(255, 255, 255, 1)),
                  child: Column(
                    children: [
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.only(
                            top: 120,
                          ),
                          child: Row(
                            verticalDirection: VerticalDirection.down,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                "assets/icon/QR.svg",
                                height: 91,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 27),
                                child: Text(
                                  "$counter",
                                  style: const TextStyle(fontSize: 58),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 35, bottom: 35),
                        child: TextField(
                          decoration: const InputDecoration(
                            filled: true,
                            fillColor: Color.fromRGBO(235, 235, 232, 1),
                          ),
                          cursorRadius: Radius.circular(10),
                          controller: _controller,
                          expands: false,
                          maxLines: 5,
                          minLines: 2,
                        ),
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              Checkbox(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25)),
                                // checkColor: Colors.white,
                                fillColor:
                                    MaterialStateProperty.resolveWith(getColor),
                                value: isCheckedOne,
                                onChanged: (bool? value) {
                                  setState(() {
                                    isCheckedOne = value!;
                                    if (isCheckedOne == true) {
                                      isCheckedTwo = false;
                                      isChecked = isCheckedOne;
                                    }
                                  });
                                },
                              ),
                              const Text(
                                "Թափոնը մաքուր էր",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Color.fromRGBO(0, 0, 0, 1)),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Checkbox(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25)),
                                // checkColor: Colors.white,
                                fillColor:
                                    MaterialStateProperty.resolveWith(getColor),
                                value: isCheckedTwo,
                                onChanged: (bool? value) {
                                  setState(() {
                                    isCheckedTwo = value!;
                                    if (isCheckedTwo == true) {
                                      isCheckedOne = false;
                                      isChecked = isCheckedTwo;
                                    }
                                  });
                                },
                              ),
                              const Text(
                                "Թափոնը մաքուր չէր",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: Color.fromRGBO(0, 0, 0, 1)),
                              )
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 39),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                side: const BorderSide(
                                    width: 1,
                                    color: Color.fromRGBO(112, 112, 112, 1)),
                                primary: const Color.fromRGBO(255, 255, 255, 1),

                                elevation: 0,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                                minimumSize: Size(135, 36), //////// HERE
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: const Text('Չեղարկել',
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    color: Color.fromRGBO(112, 112, 112, 1),
                                    fontSize: 15,
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 18),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Color.fromRGBO(159, 205, 79, 1),

                                  elevation: 0,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  minimumSize: Size(135, 36), //////// HERE
                                ),
                                onPressed: () {
                                  _onQRCounterAndReasonButtonPressed();
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (contet) => BlocProvider(
                                      create: (context) => BoolCubit(),
                                      child: const Profile(),
                                    ),
                                  ));
                                },
                                child: const Text('Ավարտել',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      color: Color.fromRGBO(247, 247, 247, 1),
                                      fontSize: 15,
                                    )),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }
}
