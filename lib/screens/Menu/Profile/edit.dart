// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:login_register_token/bloc/Order_bloc/order_bloc.dart';
// import 'package:path/path.dart' as path;
// import '../../../bloc/Auth_Bloc/bloc/auth_bloc.dart';
// import '../../../bloc/profileEdit_send/bloc/profile_edit_bloc.dart';
// import '../../../repository.dart';
// import 'User.dart';
// import 'Widget/button_widget.dart';
// import 'Widget/profile_widget.dart';
// import 'Widget/textfield_widget.dart';

// class Edit extends StatefulWidget {
//   const Edit({Key? key}) : super(key: key);

//   @override
//   _EditState createState() =>
//       _EditState(authBloc: AuthBloc(), userRepository: UserRepository());
// }

// class _EditState extends State<Edit> {
//   UserRepository userRepository;
//   AuthBloc authBloc;
//   _EditState({required this.authBloc, required this.userRepository});

//   late User user;

//   @override
//   void initState() {
//     super.initState();

//     user = UserPrafrence.getUser();
//   }

//   File? image;
//   Future pickerImage() async {
//     try {
//       final image = await ImagePicker().getImage(source: ImageSource.gallery);
//       if (image == null) {
//         return;
//       }
//       final imageTemprory = File(image.path);
//       setState(() {
//         this.image = imageTemprory;
//         user = user.copy(imagePath: image.path);
//       });
//     } on PlatformException catch (e) {
//       return e;
//     }
//   }

//   onProfileEditButtonPressed(
//       String fullName, String phone, String email, String imagePath) {
//     BlocProvider.of<ProfileEditBloc>(context).add(ProfileEditButtonPressed(
//         imagePath: imagePath, fullName: fullName, phone: phone, email: email));
//     print("ProfilEditMetod $imagePath,  $fullName ,  $phone, $email");
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Scaffold(
//           body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: ListView(children: [
//           BlocBuilder<ListBloc, ListState>(
//             builder: (context, state) {
//               if (state is FetchSuccses) {
//                 return Column(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(top: 70),
//                       child: Stack(
//                         children: [
//                           image != null
//                               ? ClipOval(
//                                   child: Image.file(
//                                     image!,
//                                     width: 160,
//                                     height: 160,
//                                     fit: BoxFit.cover,
//                                   ),
//                                 )
//                               : ClipOval(
//                                   child: Image.asset("assets/profile.jpg",
//                                       width: 160,
//                                       height: 160,
//                                       fit: BoxFit.cover)),
//                           Positioned(
//                             bottom: 0,
//                             right: 0,
//                             child: IconButton(
//                               onPressed: () {
//                                 pickerImage();
//                               },
//                               icon: const Icon(Icons.camera),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     const SizedBox(
//                       height: 20,
//                     ),
//                     TextFieldWidget(
//                       label: 'Full Name',
//                       text: state.orders[0].id.toString(),
//                       onChanged: (name) => user = user.copy(fullName: name),
//                     ),
//                     const SizedBox(height: 24),
//                     TextFieldWidget(
//                       label: 'Phone Number',
//                       text: state.orders[0].title,
//                       onChanged: (phone) =>
//                           user = user.copy(phoneNumber: phone),
//                     ),
//                     const SizedBox(height: 24),
//                     TextFieldWidget(
//                       label: 'Email',
//                       text: state.orders[0].id.toString(),
//                       onChanged: (email) => user = user.copy(email: email),
//                     ),
//                     const SizedBox(height: 24),
//                     ButtonWidget(
//                       text: 'Save',
//                       onClicked: () {
//                         onProfileEditButtonPressed(user.fullName,
//                             user.phoneNumber, user.email, user.imagePath);
//                         UserPrafrence.setUser(user);
//                         Navigator.of(context).pop();
//                       },
//                     ),
//                     const SizedBox(
//                       height: 20.0,
//                     ),
//                   ],
//                 );
//               }
//               return const Text("data");
//             },
//           ),
//         ]),
//       )),
//     );
//   }
// }
