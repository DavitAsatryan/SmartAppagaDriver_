import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../Cubit/cubit/acceptfinish_cubit.dart';
import '../../../bloc/Confirm/bloc/confirm_bloc.dart';
import '../../../bloc/Order_bloc/order_bloc.dart';
import 'Home.dart';

class AboutMore extends StatefulWidget {
  AboutMore({
    Key? key,
    required this.index,
    required this.counter,
    required this.pickTrue,
    required this.cancelPick,
  }) : super(key: key);
  int index;
  int counter;
  bool pickTrue;
  bool cancelPick;

  @override
  _aboutMoreState createState() => _aboutMoreState(
      index: index,
      counter: counter,
      pickTrue: pickTrue,
      cancelPick: cancelPick);
}

class _aboutMoreState extends State<AboutMore> {
  _onConfirmButtonPressed() {
    BlocProvider.of<ConfirmBloc>(context).add(
      const ConfirmButtonPressed(
        confirmText: "Confirm send to backend",
      ),
    );
  }

  _onAcceptFinishButtonPressed(String text) {
    BlocProvider.of<AcceptfinishCubit>(context).acceptFinishMetod(text);
  }

  int index;
  int counter;
  bool pickTrue;
  bool cancelPick;

  _aboutMoreState(
      {required this.index,
      required this.counter,
      required this.pickTrue,
      required this.cancelPick});
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print("counter  $counter");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(12, 128, 64, 1),
      ),
      body: Container(
        child: Center(child: BlocBuilder<ListBloc, ListState>(
          builder: (context, state) {
            var acceptFinish = BlocProvider.of<AcceptfinishCubit>(context);

            if (state is FetchSuccses) {
              if (counter == 1) {
                //  _onConfirmButtonPressed();

                // state.orders[index].accept = "Finish";
              }
              return aboutMoreMetod(context, state, false, false);
            } else if (state is AssignedSuccses) {
              if (counter == 1) {
                //  _onConfirmButtonPressed();

                // state.orders[index].accept = "Finish";
              }
              return aboutMoreMetod(context, state, true, false);
            } else if (state is CompletedSuccses) {
              if (counter == 1) {
                //  _onConfirmButtonPressed();

                // state.orders[index].accept = "Finish";
              }
              return aboutMoreMetod(context, state, false, true);
            }
            return const Text("");
          },
        )),
      ),
    );
  }

  Container aboutMoreMetod(
      BuildContext context, dynamic state, bool pick, bool cancelPick) {
    return Container(
      width: 289,
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        width: 1, color: Color.fromRGBO(183, 183, 183, 0.33)))),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(17, 20, 57, 17),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SvgPicture.asset("assets/icon/oracuyc.svg"),
                      const Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(9.4, 0, 0, 0),
                        child: Text(
                          '07 / 12 / 21',
                          style: TextStyle(
                            color: Color.fromRGBO(0, 0, 0, 1),
                            fontFamily: 'Poppins',
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SvgPicture.asset("assets/icon/clock.svg"),
                      const Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(9.4, 0, 0, 0),
                        child: Text(
                          '15։45-16:00',
                          style: TextStyle(
                            color: Color.fromRGBO(0, 0, 0, 1),
                            fontFamily: 'Poppins',
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: 289,
            decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        width: 1, color: Color.fromRGBO(183, 183, 183, 0.33)))),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(17, 18, 57, 17),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 19),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        SvgPicture.asset(
                          "assets/icon/profile.svg",
                          height: 16,
                          color: const Color.fromRGBO(154, 154, 154, 1),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(9.4, 0, 0, 0),
                          child: Text(
                            'Արևիկ Մեսրոպյան',
                            style: TextStyle(
                              color: Color.fromRGBO(0, 0, 0, 1),
                              fontFamily: 'Poppins',
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      SvgPicture.asset(
                        "assets/icon/phone.svg",
                        height: 16,
                        color: const Color.fromRGBO(154, 154, 154, 1),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(9.4, 0, 0, 0),
                        child: Text(
                          '+374-94-53-01-95',
                          style: TextStyle(
                            color: Color.fromRGBO(0, 0, 0, 1),
                            fontFamily: 'Poppins',
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: 289,
            decoration: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(
                        width: 1, color: Color.fromRGBO(183, 183, 183, 0.33)))),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(0, 18, 0, 0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 18),
                    child: Container(
                      width: 50,
                      height: 71,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          border: Border.fromBorderSide(BorderSide(
                              width: 2,
                              color: Color.fromRGBO(183, 183, 183, 0.33)))),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 11, left: 6, right: 6),
                            child: Container(
                              decoration: const BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          width: 1,
                                          color: Color.fromRGBO(
                                              183, 183, 183, 0.33)))),
                              width: 37,
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 5),
                                child:
                                    SvgPicture.asset("assets/icon/plastic.svg"),
                              ),
                            ),
                          ),
                          Container(
                            width: 37,
                            child: const Padding(
                              padding: EdgeInsets.only(top: 7.5),
                              child: Center(
                                child: Text(
                                  '1',
                                  style: TextStyle(
                                    color: Color.fromRGBO(0, 0, 0, 1),
                                    fontFamily: 'Poppins',
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 18, left: 29),
                    child: Container(
                      width: 50,
                      height: 71,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          border: Border.fromBorderSide(BorderSide(
                              width: 2,
                              color: Color.fromRGBO(183, 183, 183, 0.33)))),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 11, left: 6, right: 6),
                            child: Container(
                              decoration: const BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          width: 1,
                                          color: Color.fromRGBO(
                                              183, 183, 183, 0.33)))),
                              width: 37,
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 5),
                                child:
                                    SvgPicture.asset("assets/icon/paper.svg"),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 0, left: 6, right: 6),
                            child: Container(
                              width: 37,
                              child: const Padding(
                                padding: EdgeInsets.only(top: 7.5),
                                child: Center(
                                  child: Text(
                                    '2',
                                    style: TextStyle(
                                      color: Color.fromRGBO(0, 0, 0, 1),
                                      fontFamily: 'Poppins',
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 18, left: 29),
                    child: Container(
                      width: 50,
                      height: 71,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          border: Border.fromBorderSide(BorderSide(
                              width: 2,
                              color: Color.fromRGBO(183, 183, 183, 0.33)))),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 11, left: 6, right: 6),
                            child: Container(
                              decoration: const BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          width: 1,
                                          color: Color.fromRGBO(
                                              183, 183, 183, 0.33)))),
                              width: 37,
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 5),
                                child:
                                    SvgPicture.asset("assets/icon/glass.svg"),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 0, left: 6, right: 6),
                            child: Container(
                              width: 37,
                              child: const Padding(
                                padding: EdgeInsets.only(top: 7.5),
                                child: Center(
                                  child: Text(
                                    '3',
                                    style: TextStyle(
                                      color: Color.fromRGBO(0, 0, 0, 1),
                                      fontFamily: 'Poppins',
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 18, left: 29),
                    child: Container(
                      width: 50,
                      height: 71,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          border: Border.fromBorderSide(BorderSide(
                              width: 2,
                              color: Color.fromRGBO(183, 183, 183, 0.33)))),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 11, left: 6, right: 6),
                            child: Container(
                              decoration: const BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          width: 1,
                                          color: Color.fromRGBO(
                                              183, 183, 183, 0.33)))),
                              width: 37,
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 5),
                                child: SvgPicture.asset(
                                    "assets/icon/datark_bag.svg"),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 0, left: 6, right: 6),
                            child: Container(
                              width: 37,
                              child: const Padding(
                                padding: EdgeInsets.only(top: 7.5),
                                child: Center(
                                  child: Text(
                                    '4',
                                    style: TextStyle(
                                      color: Color.fromRGBO(0, 0, 0, 1),
                                      fontFamily: 'Poppins',
                                      fontSize: 14,
                                    ),
                                  ),
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
          Container(
            width: 289,
            height: 111,
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(17, 0, 0, 17),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  SvgPicture.asset("assets/icon/location.svg"),
                  const Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 9.4),
                      child: Text(
                        'Շենգավիթ Շիրակի փող.,1/68 շենք 1 մուտք , -3 հարկ , 42 բն.',
                        // overflow: TextOverflow.ellipsis,
                        //softWrap: true,
                        style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 1),
                          fontFamily: 'Poppins',
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: 289,
            height: 87,
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                border: Border.fromBorderSide(BorderSide(
                    width: 1, color: Color.fromRGBO(183, 183, 183, 0.33)))),
            child: Padding(
              padding: const EdgeInsetsDirectional.fromSTEB(17, 0, 0, 17),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: const [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 9.4),
                      child: Text(
                        'Մուտքը',
                        // overflow: TextOverflow.ellipsis,
                        //softWrap: true,
                        style: TextStyle(
                          color: Color.fromRGBO(75, 75, 75, 1),
                          fontFamily: 'Poppins',
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15, bottom: 12.5),
            child: Row(
              children: [
                Text(
                  "Գումարը 1500դրամ",
                  style: TextStyle(
                      color: Color.fromRGBO(0, 0, 0, 1), fontSize: 14),
                ),
              ],
            ),
          ),
          Row(
            children: [
              cancelPick == false
                  ? ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          elevation: 0,
                          primary: Color.fromRGBO(255, 255, 255, 1),
                          fixedSize: const Size(134, 35),
                          shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                  width: 1,
                                  color: Color.fromRGBO(112, 112, 112, 1)),
                              borderRadius: BorderRadius.circular(10))),
                      onPressed: () {
                        Navigator.of(context).pop(MaterialPageRoute(
                          builder: (contet) => const Home(),
                        ));
                      },
                      child: const Text(
                        "Չեղարկել",
                        style: TextStyle(
                            color: Color.fromRGBO(112, 112, 112, 1),
                            fontSize: 15),
                      ),
                    )
                  : Text(""),
              Padding(
                padding: const EdgeInsets.only(left: 18),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      elevation: 0,
                      primary: pick == false
                          ? Color.fromRGBO(159, 205, 79, 1)
                          : pick == true
                              ? Color.fromRGBO(255, 255, 255, 1)
                              : null,
                      fixedSize: const Size(134, 35),
                      shape: pick == false
                          ? RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10))
                          : pick == true
                              ? RoundedRectangleBorder(
                                  side: const BorderSide(
                                      width: 1,
                                      color: Color.fromRGBO(112, 112, 112, 1)),
                                  borderRadius: BorderRadius.circular(10))
                              : null),
                  onPressed: () async {
                    state.orders[index].counter = 1;

                    if (state.orders[index].counter == 1) {
                      _onConfirmButtonPressed();
                      setState(() {
                        state.orders[index].accept = "Ավարտել";
                        _onAcceptFinishButtonPressed(
                            state.orders[index].accept);
                      });
                    }

                    // if (state.orders[index].counter == 2) {
                    //   Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => QrCode()),
                    //   );
                    //   state.orders[index].counter = 1;
                    // }

                    Navigator.of(context).pop(MaterialPageRoute(
                      builder: (contet) => MultiBlocProvider(
                        providers: [
                          BlocProvider.value(
                            value: BlocProvider.of<AcceptfinishCubit>(context),
                          ),
                        ],
                        child: const Home(),
                      ),
                    ));
                  },
                  child: BlocBuilder<AcceptfinishCubit, AcceptFinishState>(
                    builder: (context, states) {
                      /////////
                      state.orders[index].accept = states.acceptFinishCubit;
                      return Text(
                          pick == false
                              ? state.orders[index].accept
                              : pick == true
                                  ? "Ավարտել"
                                  : null,
                          style: TextStyle(
                              color: pick == false
                                  ? Color.fromRGBO(247, 247, 247, 1)
                                  : pick == true
                                      ? Color.fromRGBO(112, 112, 112, 1)
                                      : null,
                              fontSize: 15));
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
