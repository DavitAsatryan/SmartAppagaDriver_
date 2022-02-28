
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:login_register_token/screens/Menu/Profile/User.dart';


// AppBar buildAppBar(BuildContext context) {
//   final user = UserPrafrence.getUser();
//   final isDarkMode = user.;
//   final icon = isDarkMode ? CupertinoIcons.sun_max : CupertinoIcons.moon_stars;

//   return AppBar(
//     leading: BackButton(),
//     backgroundColor: Colors.transparent,
//     elevation: 0,
//     actions: [
//       ThemeSwitcher(
//         builder: (context) => IconButton(
//           icon: Icon(icon),
//           onPressed: () {
//             final theme = isDarkMode ? MyThemes.lightTheme : MyThemes.darkTheme;

//             final switcher = ThemeSwitcher.of(context)!;
//             switcher.changeTheme(theme: theme);

//             final newUser = user.copy(isDarkMode: !isDarkMode);
//             UserPreferences.setUser(newUser);
//           },
//         ),
//       ),
//     ],
//   );
// }