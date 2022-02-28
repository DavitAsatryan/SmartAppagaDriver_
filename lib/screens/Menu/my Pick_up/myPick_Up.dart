import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:login_register_token/Cubit/Internet/cubit/internet_cubit.dart';
import 'package:login_register_token/Cubit/cubit/acceptfinish_cubit.dart';
import 'package:login_register_token/bloc/FIltr_send_text/bloc/filtr_bloc.dart';
import 'package:login_register_token/bloc/Notification/bloc/notification_bloc.dart';
import 'package:login_register_token/bloc/QrCodeSend/bloc/qr_send_bloc.dart';
import 'package:login_register_token/screens/Menu/scrollToHide.dart';
import 'package:login_register_token/screens/notification/notification.dart';

import '../../../Cubit/cubit/bool_cubit.dart';
import '../../../bloc/Auth_Bloc/bloc/auth_bloc.dart';
import '../../../bloc/Confirm/bloc/confirm_bloc.dart';
import '../../../bloc/Order_bloc/order_bloc.dart';
import '../../../repository.dart';

import '../../QR_code/qr_code.dart';
import '../Home/AboutMore.dart';
//import 'filtr.dart';

class MyPickUp extends StatefulWidget {
  const MyPickUp({Key? key}) : super(key: key);

  @override
  MyPickUpState createState() => MyPickUpState(
        auth: AuthBloc(),
        userRepository: UserRepository(),
      );
}

class MyPickUpState extends State<MyPickUp> {
  TextEditingController _controllerId = TextEditingController();

  UserRepository userRepository;
  AuthBloc auth;
  var blocOrder;
  var acceptFinish;

  bool isFinish = true;
  bool colorMenu = false;
  bool hideButton = false;
  bool navigQR = true;
  String titleText = "Իմ հավաքները";

  MyPickUpState({required this.auth, required this.userRepository});
  _onFiltrButtonPressed(FiltrEvent filtrEvent) {
    BlocProvider.of<FiltrBloc>(context).add(filtrEvent);
    print(filtrEvent);
  }
  // pickups models List
//  List<OrderModel> models = [];

  // get json data from list
  final _scrollController = ScrollController();

  String textNext = "";
  bool isChecked = false;
  List<String> sendSectionsList = [];
  List section = [
    "Աջափնյակ",
    "Արաբկիր",
    "Ավան",
    "Դավիթաշեն",
    "Էրեբունի",
    "Քանաքեռ-Զեյթուն",
    "Կենտրոն",
    "Մալաթիա-Սեբաստիա",
    "Նորք-Մարաշ",
    "Նոր Նորք",
    "Նուբարաշեն",
    "Շենգավիթ"
  ];
  @override
  void initState() {
    print("initalstate");
    blocOrder = BlocProvider.of<ListBloc>(context);
    blocOrder.add(AssignedEvent());
    // var boolCubit = BlocProvider.of<BoolCubit>(context);

    acceptFinish = BlocProvider.of<AcceptfinishCubit>(context);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    BoolCubit().close();
    AcceptfinishCubit().close();
    ConfirmBloc(authenticationBloc: AuthBloc(), userRepository: userRepository)
        .close();
  }

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

  @override
  Widget build(BuildContext context) {
    Color colors = Color.fromRGBO(12, 128, 64, 1);

    double width = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(color: Color.fromRGBO(232, 232, 232, 1)),
      width: double.infinity,
      height: double.infinity,
      child: Column(
        children: [
          ScrollToWidget(
            controller: _scrollController,
            child: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/notificaion.png"),
                      fit: BoxFit.cover)),
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "$titleText",
                          style: const TextStyle(
                              color: Color.fromRGBO(232, 232, 232, 1),
                              fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 23.3),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(),
                          child: IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => BlocProvider(
                                              create: (context) =>
                                                  NotificationBloc(
                                                      authenticationBloc:
                                                          BlocProvider.of<
                                                                  AuthBloc>(
                                                              context),
                                                      repository:
                                                          userRepository),
                                              child: const NotificationNew(),
                                            )));
                              },
                              icon: SvgPicture.asset(
                                  "assets/icon/notification.svg")),
                        ),
                      ],
                    ),
                  ),
                  filtr(context),
                ],
              ),
            ),
          ),
          Expanded(
            child: BlocBuilder<ListBloc, ListState>(builder: (context, state) {
              if (state is InitialState) {
                return const Center(
                    child: CircularProgressIndicator(color: Colors.green));
              } else if (state is LoadingState) {
                return const Center(
                    child: CircularProgressIndicator(color: Colors.green));
              } else if (state is SectionsSuccses) {
                return Container(
                  child:
                      gridViewOrder(state, state.orders.length, state.orders),
                );
              }
              if (state is AssignedSuccses) {
                // colorMenu = false;
                // hideButton = false;
                textNext = "Ավարտել";
                return Container(
                    child: gridViewOrder(
                        state, state.orders.length, state.orders));
              } else if (state is CompletedSuccses) {
                // colorMenu = true;
                // hideButton = false;
                // textNext = "1500 դրամ";

                return Container(
                    child: gridViewOrder(
                        state, state.orders.length, state.orders));
              } else if (state is IncompleteSuccses) {
                return Container(
                    child: gridViewOrder(
                        state, state.orders.length, state.orders));
              } else if (state is MissedSuccses) {
                return Container(
                    child: gridViewOrder(
                        state, state.orders.length, state.orders));
              }
              return Container(
                child: const Center(child: CircularProgressIndicator()),
              );
            }),
          ),
        ],
      ),
    );
  }

  Padding filtr(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 21),
      child: Row(
        children: [
          IconButton(
              icon: SvgPicture.asset("assets/icon/filtr.svg"),
              tooltip: 'Increase volume by 10',
              onPressed: () {
                isChecked = false;
                sendSectionsList.clear();
                showDialog(
                    barrierColor: Colors.transparent,
                    context: context,
                    builder: (context) {
                      return Dialog(
                          elevation: 0,
                          backgroundColor: Colors.transparent,
                          insetPadding: EdgeInsets.only(top: 10),
                          child: Stack(
                            children: <Widget>[
                              Padding(
                                  padding: const EdgeInsets.only(
                                      top: 84, bottom: 49),
                                  child: Container(
                                    width: double.infinity,
                                    height: double.infinity,
                                    decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10)),
                                        color:
                                            Color.fromRGBO(255, 255, 255, 1)),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 11, right: 18, top: 16),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.stretch,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 10),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                SvgPicture.asset(
                                                    "assets/icon/filtr.svg"),
                                                IconButton(
                                                  onPressed: () {
                                                    Navigator.of(context).pop();
                                                  },
                                                  icon: SvgPicture.asset(
                                                      "assets/icon/x.svg"),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                left: 31, right: 88),
                                            child: Container(
                                              height: 154,
                                              decoration: const BoxDecoration(
                                                border: Border(
                                                  bottom: BorderSide(
                                                    width: 0.5,
                                                    color: Color.fromRGBO(
                                                        112, 112, 112, 1),
                                                  ),
                                                ),
                                              ),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        navigQR = true;
                                                        colorMenu = false;
                                                        textNext = "Ավարտել";
                                                        hideButton = false;
                                                        titleText =
                                                            "Իմ հավաքները";
                                                      });
                                                      var blocOrder =
                                                          BlocProvider.of<
                                                                  ListBloc>(
                                                              context);

                                                      blocOrder
                                                          .add(AssignedEvent());
                                                      _onFiltrButtonPressed(
                                                          const FiltrAssignedButtonPressed(
                                                              assignedText:
                                                                  "assigned"));

                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: const Padding(
                                                      padding: EdgeInsets.only(
                                                          bottom: 15),
                                                      child: Text(
                                                        "Իմ հավաքները",
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                          color: Color.fromRGBO(
                                                              12, 128, 64, 1),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        navigQR = false;
                                                        colorMenu = true;
                                                        textNext = "1500 դրամ";
                                                        hideButton = false;
                                                        titleText = "Ավարտված";
                                                      });
                                                      var blocOrder =
                                                          BlocProvider.of<
                                                                  ListBloc>(
                                                              context);

                                                      blocOrder.add(
                                                          CompletedEvent());
                                                      _onFiltrButtonPressed(
                                                          const FiltrCompletedButtonPressed(
                                                              completedText:
                                                                  "completed"));
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: const Padding(
                                                      padding: EdgeInsets.only(
                                                          bottom: 15),
                                                      child: Text(
                                                        "Ավարտված",
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            color:
                                                                Color.fromRGBO(
                                                                    12,
                                                                    128,
                                                                    64,
                                                                    1)),
                                                      ),
                                                    ),
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        hideButton = true;
                                                        titleText = "Չկատարված";
                                                      });
                                                      var blocOrder =
                                                          BlocProvider.of<
                                                                  ListBloc>(
                                                              context);

                                                      blocOrder.add(
                                                          IncompleteEvent());
                                                      _onFiltrButtonPressed(
                                                          const FiltrIncompleteButtonPressed(
                                                              incompleteText:
                                                                  "incomplete"));

                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: const Padding(
                                                      padding: EdgeInsets.only(
                                                          bottom: 15),
                                                      child: Text(
                                                        "Չկատարված",
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            color:
                                                                Color.fromRGBO(
                                                                    12,
                                                                    128,
                                                                    64,
                                                                    1)),
                                                      ),
                                                    ),
                                                  ),
                                                  InkWell(
                                                    onTap: () {
                                                      setState(() {
                                                        hideButton = true;
                                                        titleText =
                                                            "Բաց թողնված";
                                                      });
                                                      var blocOrder =
                                                          BlocProvider.of<
                                                                  ListBloc>(
                                                              context);

                                                      blocOrder
                                                          .add(MissedEvent());
                                                      _onFiltrButtonPressed(
                                                          const FiltrMissedButtonPressed(
                                                              missedText:
                                                                  "missed"));
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                    child: const Padding(
                                                      padding: EdgeInsets.only(
                                                          bottom: 15),
                                                      child: Text(
                                                        "Բաց թողնված",
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            color:
                                                                Color.fromRGBO(
                                                                    12,
                                                                    128,
                                                                    64,
                                                                    1)),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 15, left: 31),
                                            child: Row(
                                              children: const [
                                                Text(
                                                  "Ըստ  տարածաշրջանի",
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      color: Color.fromRGBO(
                                                          12, 128, 64, 1)),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Expanded(
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 18),
                                              child: ListView.builder(
                                                addAutomaticKeepAlives: false,
                                                scrollDirection: Axis.vertical,
                                                itemCount: section.length,
                                                itemBuilder: (context, index) {
                                                  return StatefulBuilder(
                                                      builder: (context,
                                                          StateSetter
                                                              setState) {
                                                    return Row(
                                                      children: [
                                                        Checkbox(
                                                            value: isChecked,
                                                            onChanged:
                                                                (checked) {
                                                              setState(() {
                                                                isChecked =
                                                                    checked!;
                                                              });
                                                              if (isChecked ==
                                                                  true) {
                                                                sendSectionsList
                                                                    .add(section[
                                                                        index]);
                                                                print(
                                                                    sendSectionsList);
                                                              }
                                                            }),
                                                        Text(
                                                            "${section[index]}",
                                                            style: const TextStyle(
                                                                fontSize: 16,
                                                                color: Color
                                                                    .fromRGBO(
                                                                        75,
                                                                        75,
                                                                        75,
                                                                        1))),
                                                      ],
                                                    );

                                                    // return ListTile(
                                                    //   leading: Checkbox(
                                                    //       value:
                                                    //           isChecked,
                                                    //       onChanged:
                                                    //           (checked) {
                                                    //         setState(
                                                    //             () {
                                                    //           isChecked =
                                                    //               checked!;
                                                    //         });
                                                    //       }),
                                                    //   title: Text(
                                                    //       "${section[index]}",
                                                    //       style: TextStyle(
                                                    //           fontSize:
                                                    //               16,
                                                    //           color: Color.fromRGBO(
                                                    //               75,
                                                    //               75,
                                                    //               75,
                                                    //               1))),
                                                    // );
                                                  });
                                                },
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )),
                            ],
                          ));
                    }).then((value) {
                  print("then section  $sendSectionsList");
                  blocOrder = BlocProvider.of<ListBloc>(context);
                  blocOrder
                      .add(SectionButtonPressed(section: sendSectionsList));
                });

                // showDialog(
                //     context: context,
                //     builder: (_) => AlertDialog(
                //           shape: const RoundedRectangleBorder(
                //               borderRadius: BorderRadius.all(
                //                   Radius.circular(10.0))),
                //           content: Builder(
                //             builder: (context) {
                //               // Get available height and width of the build area of this widget. Make a choice depending on the size.
                //               var height = 0;
                //               var width = double.infinity;

                //               return Container(
                //                 height: height - 100,
                //                 width: width - double.infinity,
                //               );
                //             },
                //           ),
                //         ));
              })
        ],
      ),
    );
  }

  Column gridViewOrder(dynamic state, int itemCount, List<OrderModel> order) {
    return Column(
      children: [
        Expanded(
          child: Container(
            decoration: BoxDecoration(color: Color.fromRGBO(232, 232, 232, 1)),
            child: ListView.builder(
              controller: _scrollController,
              itemCount: itemCount,
              itemBuilder: (context, index) {
                return Padding(
                  padding:
                      const EdgeInsets.only(left: 20, right: 20, bottom: 22),
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(7),
                          topRight: Radius.circular(7)),
                      // borderRadius: BorderRadius.circular(3),
                      color: Color.fromRGBO(255, 255, 255, 1),
                    ),
                    height: 126,
                    width: 280,
                    //color: const Color.fromRGBO(255, 255, 255, 1),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0, 10, 0, 12),
                          child: Container(
                            width: double.infinity,
                            height: 34,
                            decoration: const BoxDecoration(
                              color: Color.fromRGBO(255, 255, 255, 1),
                              border: Border(
                                bottom: BorderSide(
                                    width: 1,
                                    color: Color.fromRGBO(232, 232, 232, 1)),
                              ),
                            ),
                            child: const Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                              child: Text(
                                'Malatia',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              12, 0, 10, 11),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  SvgPicture.asset(
                                    "assets/icon/bag.svg",
                                    height: 18,
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        5.9, 0, 0, 0),
                                    child: Text(
                                      '2',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        23, 0, 0, 0),
                                    child: SvgPicture.asset(
                                      "assets/icon/datark_bag.svg",
                                      height: 18,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        5.9, 0, 0, 0),
                                    child: Text(
                                      '1',
                                      style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                children: const [
                                  Text(
                                    '10:00',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    ' - ',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 16,
                                    ),
                                  ),
                                  Text(
                                    '13:15',
                                    style: TextStyle(
                                      fontFamily: 'Poppins',
                                      fontSize: 16,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 40,
                          child: Row(
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: hideButton == true
                                          ? Color.fromRGBO(255, 255, 255, 1)
                                          : Color.fromRGBO(255, 255, 255, 1),
                                    ),
                                    child: const Center(
                                        child: Text(
                                      'Տեսնել ավելին',
                                      style: TextStyle(
                                          color:
                                              Color.fromRGBO(12, 128, 64, 1)),
                                    )),
                                  ),
                                  onTap: () async {
                                    print(
                                        "print icon cubit text ${state.orders[index].accept}");
                                    _onAcceptFinishButtonPressed(
                                        state.orders[index].accept);

                                    await Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (_) => MultiBlocProvider(
                                                  providers: [
                                                    BlocProvider(
                                                      create: (context) =>
                                                          ConfirmBloc(
                                                        authenticationBloc:
                                                            AuthBloc(),
                                                        userRepository:
                                                            UserRepository(),
                                                      ),
                                                    ),
                                                    BlocProvider.value(
                                                      value: BlocProvider.of<
                                                              AcceptfinishCubit>(
                                                          context),
                                                    ),
                                                    BlocProvider.value(
                                                      value: BlocProvider.of<
                                                          BoolCubit>(context),
                                                    ),
                                                  ],
                                                  child: AboutMore(
                                                    cancelPick: false,
                                                    pickTrue: true,
                                                    counter:
                                                        order[index].counter,
                                                    index: index,
                                                  ),
                                                )));
                                  },
                                ),
                              ),
                              hideButton == false
                                  ? Expanded(
                                      child: GestureDetector(
                                        child: Container(
                                          decoration: BoxDecoration(
                                              color: colorMenu == false
                                                  ? const Color.fromRGBO(
                                                      159, 205, 79, 1)
                                                  : const Color.fromRGBO(
                                                      169, 166, 166, 1)),
                                          child: Center(
                                            child: Text(
                                              "$textNext",
                                              style: const TextStyle(
                                                  fontSize: 16,
                                                  color: Color.fromRGBO(
                                                      240, 240, 240, 1)),
                                            ),
                                          ),
                                        ),
                                        onTap: () {
                                          navigQR == true
                                              ? Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder:
                                                          (context) =>
                                                              BlocProvider<
                                                                  QrSendBloc>(
                                                                create: (context) => QrSendBloc(
                                                                    authenticationBloc:
                                                                        BlocProvider.of<AuthBloc>(
                                                                            context),
                                                                    userRepository:
                                                                        UserRepository()),
                                                                child:
                                                                    const QrCode(),
                                                              )),
                                                )
                                              : null;

                                          //   //           // blocOrder = BlocProvider.of<ListBloc>(context);
                                        },
                                      ),
                                    )
                                  : Text(""),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
