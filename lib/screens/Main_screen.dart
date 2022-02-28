import 'dart:convert';

import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_register_token/Cubit/Internet/cubit/internet_cubit.dart';
import 'package:login_register_token/Cubit/cubit/acceptfinish_cubit.dart';
import 'package:login_register_token/bloc/Auth_Bloc/bloc/auth_bloc.dart';
import 'package:login_register_token/bloc/Confirm/bloc/confirm_bloc.dart';
import 'package:login_register_token/bloc/profileEdit_send/Password_Bloc/bloc/password_change_bloc.dart';
import 'package:login_register_token/bloc/profileEdit_send/bloc/profile_edit_bloc.dart';

import 'package:login_register_token/repository.dart';

import 'package:login_register_token/screens/QR_code/qr_code.dart';

import '../Cubit/cubit/bool_cubit.dart';
import '../bloc/FIltr_send_text/bloc/filtr_bloc.dart';
import '../bloc/Order_bloc/order_bloc.dart';
import 'Menu/Home/Home.dart';
import 'Menu/Profile/profile.dart';
import 'Menu/my Pick_up/myPick_Up.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() =>
      _MainScreenState(userRepository: UserRepository());
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;
  UserRepository userRepository;
  _MainScreenState({required this.userRepository});
  final Tabs = [
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FiltrBloc(
              authenticationBloc: BlocProvider.of<AuthBloc>(context),
              userRepository: UserRepository()),
        ),
        BlocProvider(
          create: (context) => AcceptfinishCubit(),
        ),
      ],
      child: const Home(),
    ),
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ProfileEditBloc(
              authenticationBloc: BlocProvider.of<AuthBloc>(context),
              userRepository: UserRepository()),
        ),
        BlocProvider(
          create: (context) => PasswordChangeBloc(
              authenticationBloc: BlocProvider.of<AuthBloc>(context),
              userRepository: UserRepository()),
        ),
        BlocProvider(
          create: (context) => ListBloc(
              authenticationBloc: BlocProvider.of<AuthBloc>(context),
              repository: UserRepository(),
              internetCubit: InternetCubit(connectivity: Connectivity())),
        ),
      ],
      child: const Profile(),
    ),
    MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FiltrBloc(
              authenticationBloc: BlocProvider.of<AuthBloc>(context),
              userRepository: UserRepository()),
        ),
        BlocProvider(
          create: (context) => AcceptfinishCubit(),
        ),
      ],
      child: const MyPickUp(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Tabs[_currentIndex],

        //Bottom

        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color.fromRGBO(31, 31, 31, 1),
          currentIndex: _currentIndex,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(
                  Icons.home,
                  color: Color.fromRGBO(255, 255, 255, 1),
                ),
                label: "",
                backgroundColor: Color.fromRGBO(255, 255, 255, 1)),
            BottomNavigationBarItem(
                icon: Icon(Icons.portrait_outlined),
                label: "",
                backgroundColor: Color.fromRGBO(255, 255, 255, 1)),
            BottomNavigationBarItem(
                icon: Icon(Icons.payment),
                label: "",
                backgroundColor: Color.fromRGBO(255, 255, 255, 1))
          ],
          selectedItemColor: Color.fromRGBO(159, 205, 79, 1),
          onTap: (value) {
            setState(() {
              _currentIndex = value;
            });
          },
        ));
  }
}
