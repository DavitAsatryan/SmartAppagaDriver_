import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_register_token/Cubit/Internet/cubit/internet_cubit.dart';
import 'package:login_register_token/Cubit/cubit/bool_cubit.dart';
import 'package:login_register_token/Enum/internetEnum.dart';
import 'package:login_register_token/bloc/Auth_Bloc/bloc/auth_bloc.dart';
import 'package:login_register_token/bloc/Confirm/bloc/confirm_bloc.dart';
import 'package:login_register_token/bloc/profileEdit_send/Password_Bloc/bloc/password_change_bloc.dart';
import 'package:login_register_token/bloc/profileEdit_send/bloc/profile_edit_bloc.dart';

import 'package:login_register_token/repository.dart';
import 'package:login_register_token/screens/Main_screen.dart';
import 'package:login_register_token/screens/Menu/Profile/User.dart';
import 'package:login_register_token/screens/Menu/Profile/profile.dart';

import 'package:login_register_token/screens/login_screen.dart';
import 'package:login_register_token/screens/register_screen.dart';

import 'bloc/Order_bloc/order_bloc.dart';

// class SimpleBlocDelegate extends BlocDelegate {
//   @override
//   void onEvent(Bloc bloc, Object event) {
//     super.onEvent(bloc, event);
//     print(event);
//   }

//   @override
//   void onTransition(Bloc bloc, Transition transition) {
//     super.onTransition(bloc, transition);
//     print(transition);
//   }

//   @override
//   void onError(Bloc bloc, Object error, StackTrace stacktrace) {
//     super.onError(bloc, error, stacktrace);
//     print(error);
//   }
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //await UserPrafrence.init();
  // BlocSupervisor.delegate = SimpleBlocDelegate();
  final userRepository = UserRepository();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AuthBloc>(
          create: (context) {
            return AuthBloc();
          },
        ),
        BlocProvider<InternetCubit>(
          create: (context) {
            return InternetCubit(connectivity: Connectivity());
          },
        ),
        BlocProvider<ListBloc>(
          create: (context) => ListBloc(
            internetCubit: InternetCubit(connectivity: Connectivity()),
            authenticationBloc: AuthBloc()..add(AppStarted()),
            repository: userRepository,
          ),
        ),
      ],
      child: MyApp(
        userRepository: userRepository,
        connectivity: Connectivity(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  final Connectivity connectivity;
  final UserRepository userRepository;

  const MyApp(
      {Key? key, required this.connectivity, required this.userRepository})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    int a = 2;
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
        ),
        home: BlocBuilder<InternetCubit, InternetState>(
          builder: (context, state) {
            if (state is InternetConnected &&
                state.connectionTYpe == ConnectionType.Wifi) {
              return authBlocBuildMetod(context);
            } else if (state is InternetConnected &&
                state.connectionTYpe == ConnectionType.Mobile) {
              return authBlocBuildMetod(context);
            } else if (state is InternetDisconnected) {
              return disconnected();
            }
            return const Scaffold(
                body: Center(child: CircularProgressIndicator()));
          },
        )

        //authBlocBuildMetod(context),
        );
  }

  Scaffold disconnected() {
    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.only(top: 220),
          child: Column(
            children: [
              ClipOval(
                  child: Image.asset("assets/disConnnected.png",
                      width: 120, height: 120, fit: BoxFit.cover)),
            ],
          ),
        ),
      ),
    );
  }

  BlocBuilder<AuthBloc, AuthenticationState> authBlocBuildMetod(
      BuildContext context) {
    return BlocBuilder<AuthBloc, AuthenticationState>(builder: (contex, state) {
      if (state is AuthenticationAuthenticated) {
        print("mennnnnnn");
        return LoginScreen(userRepository: userRepository);
      }

      if (state is AuthenticationLoading) {
        print("mssssssdddddn");
        return Scaffold(
          body: Container(
            color: Colors.white,
            width: MediaQuery.of(context).size.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: const <Widget>[
                SizedBox(
                  height: 25.0,
                  width: 25.0,
                  child: CircularProgressIndicator(
                    strokeWidth: 4.0,
                  ),
                )
              ],
            ),
          ),
        );
      }
      return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => ConfirmBloc(
                authenticationBloc: BlocProvider.of<AuthBloc>(context),
                userRepository: UserRepository()),
          ),
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
        ],
        child: const MainScreen(),
        // child: MainScreen(
        //   key: key,
        // ),
      );
    }

        //   return LoginScreen(
        //     userRepository: userRepository,
        //   );
        // },
        );
  }
}
