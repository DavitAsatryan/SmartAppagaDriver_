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
import '../my Pick_up/myPick_Up.dart';
import 'AboutMore.dart';
import 'LIst.dart';
import 'filtr.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  HomeState createState() => HomeState(
        auth: AuthBloc(),
        userRepository: UserRepository(),
      );
}

class HomeState extends State<Home> {
  TextEditingController _controllerId = TextEditingController();
  UserRepository userRepository;
  AuthBloc auth;
  var blocOrder;
  var acceptFinish;
  bool isFinish = true;
  bool dd = true;
  HomeState({required this.auth, required this.userRepository});
  final key = GlobalKey();
  final _scrollController = ScrollController();

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
    blocOrder.add(FetchEvent());

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
    return Container(
      decoration: BoxDecoration(color: Color.fromRGBO(232, 232, 232, 1)),
      child: Column(children: [
        ScrollToWidget(
          controller: _scrollController,
          child: Container(
            child: Stack(children: [
              Image(
                width: double.infinity,
                image: AssetImage("assets/notificaion.png"),
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Օրվա հավաք",
                      style: TextStyle(
                          color: Color.fromRGBO(232, 232, 232, 1),
                          fontSize: 20),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 75, right: 23.3),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => BlocProvider(
                                      create: (context) => NotificationBloc(
                                          authenticationBloc:
                                              BlocProvider.of<AuthBloc>(
                                                  context),
                                          repository: userRepository),
                                      child: const NotificationNew(),
                                    )));
                      },
                      icon: SvgPicture.asset("assets/icon/Path 20369.svg"),
                      //Image.asset("")
                    ),
                  ],
                ),
              ),
              Filtr(),
            ]),
          ),
        ),
        Container(
          child: BlocBuilder<ListBloc, ListState>(builder: (context, state) {
            if (state is InitialState) {
              return Center(
                  child: Container(
                      child: CircularProgressIndicator(color: Colors.green)));
            } else if (state is LoadingState) {
              return const Center(
                  child: CircularProgressIndicator(color: Colors.green));
            } else if (state is FetchSuccses) {
              return Container(
                child: gridViewOrder(state, state.orders.length, state.orders),
              );
            } else if (state is SectionsSuccses) {
              return Container(
                child: gridViewOrder(state, state.orders.length, state.orders),
              );
            }

            return Container(
              child: const Center(child: Text("Data Is Empty")),
            );
          }),
        )
      ]),
    );
  }

  Widget gridViewOrder(dynamic state, int itemCount, List<OrderModel> order) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(color: Color.fromRGBO(232, 232, 232, 1)),
        child: ListView.builder(
          controller: _scrollController,
          itemCount: itemCount,
          itemBuilder: (context, index) {
            return Container(
              child: Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 22),
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
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 12),
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
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
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
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(12, 0, 10, 11),
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
                                const Padding(
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
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      23, 0, 0, 0),
                                  child: SvgPicture.asset(
                                    "assets/icon/Path 19826.svg",
                                    height: 18,
                                  ),
                                ),
                                const Padding(
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
                                  decoration: const BoxDecoration(
                                    color:
                                        const Color.fromRGBO(242, 242, 242, 1),
                                  ),
                                  child: const Center(
                                      child: Text(
                                    'Տեսնել ավելին',
                                    style: TextStyle(
                                        color: Color.fromRGBO(12, 128, 64, 1)),
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
                                                ],
                                                child: AboutMore(
                                                  cancelPick: false,
                                                  pickTrue: false,
                                                  counter: order[index].counter,
                                                  index: index,
                                                ),
                                              )));
                                },
                              ),
                            ),
                            Expanded(
                              child: GestureDetector(
                                child: Container(
                                  decoration: const BoxDecoration(
                                    color:
                                        const Color.fromRGBO(159, 205, 79, 1),
                                  ),
                                  child: Center(child: BlocBuilder<
                                      AcceptfinishCubit, AcceptFinishState>(
                                    builder: (context, staten) {
                                      return Text(
                                        state.orders[index].accept,
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Color.fromRGBO(
                                                240, 240, 240, 1)),
                                      );
                                    },
                                  )),
                                ),
                                onTap: () {
                                  if (state.orders[index].accept == "Finish") {
                                    //   Navigator.push(
                                    //     context,
                                    //     MaterialPageRoute(
                                    //         builder: (context) => BlocProvider<QrSendBloc>(
                                    //               create: (context) => QrSendBloc(
                                    //                   authenticationBloc:
                                    //                       BlocProvider.of<AuthBloc>(context),
                                    //                   userRepository: UserRepository()),
                                    //               child: QrCode(),
                                    //             )),
                                    //   );
                                  }
                                  state.orders[index].counter++;
                                  print(state.orders[index].counter);
                                  if (state.orders[index].counter == 1) {
                                    _onConfirmButtonPressed();

                                    setState(() {
                                      state.orders[index].accept = "Ավարտել";
                                    });
                                  }
                                  if (state.orders[index].counter == 2) {
                                    print("erkus");
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              BlocProvider<QrSendBloc>(
                                                create: (context) => QrSendBloc(
                                                    authenticationBloc:
                                                        BlocProvider.of<
                                                            AuthBloc>(context),
                                                    userRepository:
                                                        UserRepository()),
                                                child: const QrCode(),
                                              )),
                                    );
                                    state.orders[index].counter = 1;
                                  }

                                  //   //           // blocOrder = BlocProvider.of<ListBloc>(context);
                                },
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
