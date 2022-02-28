// import 'dart:convert';

// import 'package:connectivity/connectivity.dart';
// import 'package:login_register_token/Cubit/Internet/cubit/internet_cubit.dart';
// import 'package:login_register_token/bloc/Auth_Bloc/bloc/auth_bloc.dart';
// import 'package:login_register_token/bloc/Order_bloc/order_bloc.dart';
// import 'package:login_register_token/repository.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class User {
//   final String imagePath;

//   const User({
//     required this.imagePath,
//   });

//   User copy({
//     String? imagePath,
//   }) =>
//       User(
//         imagePath: imagePath ?? this.imagePath,
//       );

//   static User fromJson(Map<String, dynamic> json) => User(
//         imagePath: json['imagePath'],
//       );

//   Map<String, dynamic> toJson() => {
//         'imagePath': imagePath,
//       };
// }

// class UserPrafrence {
//   static late SharedPreferences _preferences;
//   static const _keyUser = 'user';
//   var blocList = ListBloc(
//       authenticationBloc: AuthBloc(),
//       repository: UserRepository(),
//       internetCubit: InternetCubit(connectivity: Connectivity()));

//   static const myUer = User(
//     imagePath:
//         "https://thumbs.dreamstime.com/b/default-avatar-profile-image-vector-social-media-user-icon-potrait-182347582.jpg",
//   );
// }
