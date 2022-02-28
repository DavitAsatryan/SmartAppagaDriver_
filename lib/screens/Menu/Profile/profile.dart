import 'dart:convert';
import 'dart:io';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:login_register_token/bloc/Auth_Bloc/bloc/auth_bloc.dart';
import 'package:login_register_token/bloc/Order_bloc/order_bloc.dart';
import 'package:login_register_token/bloc/profileEdit_send/Password_Bloc/bloc/password_change_bloc.dart';
import 'package:login_register_token/bloc/profileEdit_send/bloc/profile_edit_bloc.dart';
import 'package:login_register_token/repository.dart';
import 'package:login_register_token/screens/Menu/Profile/User.dart';
import 'package:login_register_token/screens/Menu/Profile/Widget/ProfileCarData.dart';
import 'package:login_register_token/screens/Menu/Profile/edit.dart';

import '../../../Cubit/cubit/bool_cubit.dart';
import '../../login_screen.dart';
import 'ProfileNumbers.dart';
import 'Widget/profile_widget.dart';

var orderAPI = 'https://jsonplaceholder.typicode.com/posts';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

List<ProfileModel> listProfile = [];
List<ProfileNumbers> listNumbers = [];
List<ProfileCarData> listCarData = [];

final _imageController = TextEditingController();
final _fullNameController = TextEditingController();
final _phoneNumberController = TextEditingController();

final _passwordController = TextEditingController();
final _passwordTwoController = TextEditingController();
final _passwordthreeController = TextEditingController();

class _ProfileState extends State<Profile> {
  @override
  void initState() {
    var listBloc = BlocProvider.of<ListBloc>(context);
    listBloc.add(FetchEvent());
    getProfilData();
    for (var i = 0; i < listProfile.length; i++) {
      _fullNameController.text = listProfile[i].fullname;
    }
    super.initState();
  }

  bool sendBoolData = false;

  bool passwordVisibility = false;
  bool passwordVisibilityTwo = false;
  bool passwordVisibilityThree = false;

  bool isCheckedOne = false;
  bool isCheckedTwo = false;
  bool isCheckedThree = false;
  bool isCheckedFour = false;

  onProfileEditButtonPressed(
    String image,
    String fullName,
    List<ProfileNumbers> phonesList,
    List<ProfileCarData> carsList,
    bool isOne,
    bool isTwo,
    bool isThree,
    bool isFour,
  ) {
    BlocProvider.of<ProfileEditBloc>(context).add(ProfileEditButtonPressed(
        imagePath: image,
        fullName: fullName,
        phones: listNumbers,
        cars: listCarData,
        isOne: isCheckedOne,
        isTwo: isCheckedTwo,
        isThree: isCheckedThree,
        isFour: isCheckedFour));

    print(
        "ProfilEditMetod $image,  $fullName , numbers $listNumbers, $carsList, $isOne, $isTwo, $isThree, $isFour ");
  }

  onPasswordChangeButtonPressed(
      String password, String newPassword, String newPasswordTwo) {
    BlocProvider.of<PasswordChangeBloc>(context).add(
        PasswordChangeButtonPressed(
            password: password,
            newPassword: newPassword,
            newPasswordTwo: newPasswordTwo));

    print(
        "PasswordChangeBloc: $password, newPassword: $newPassword, newPasswordTwo: $newPasswordTwo   ");
  }

  File? image;
  Future pickerImage() async {
    try {
      final image = await ImagePicker().getImage(source: ImageSource.gallery);
      if (image == null) {
        return;
      }
      final imageTemprory = File(image.path);
      setState(() {
        this.image = imageTemprory;
        String imagePath = image.path;
        _imageController.text = imagePath;
      });
    } on PlatformException catch (e) {
      return e;
    }
  }

  Future getProfilData() async {
    var respose = await http.get(Uri.parse(orderAPI));

    dynamic body = jsonDecode(respose.body);
    ProfileModel profilModel;
    if (respose.statusCode == 200) {
      print("profile statusCode____200");
      body.forEach((element) {
        profilModel = ProfileModel.fromJson(element);
        listProfile.add(profilModel);
      });

      // body.forEach((element) {
      //   OrderModel orderModel = OrderModel.fromJson(element);
      //   orderList.add(orderModel);
      // });
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget okButton = Padding(
      padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 31),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: Color.fromRGBO(159, 205, 79, 1),

              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              minimumSize: Size(151, 36), //////// HERE
            ),
            onPressed: () {
              onPasswordChangeButtonPressed(_passwordController.text,
                  _passwordTwoController.text, _passwordthreeController.text);
              Navigator.of(context).pop();
            },
            child: const Text('Հաստատել',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  color: Color.fromRGBO(255, 255, 255, 1),
                  fontSize: 16,
                )),
          )
        ],
      ),
    );
    AlertDialog alert = AlertDialog(
      shape: RoundedRectangleBorder(
        side: const BorderSide(color: Color.fromARGB(255, 144, 138, 137)),
        borderRadius: BorderRadius.circular(20),
      ),
      actions: [okButton],
      title: const Text("Փոխել գաղտնաբառը",
          style: TextStyle(
            color: Color.fromRGBO(14, 14, 14, 1),
            fontSize: 16,
          )),
      content: StatefulBuilder(
        builder: (context, setState) => Container(
          height: 175,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 27),
                child: Container(
                  width: 237,
                  height: 40,
                  child: Stack(
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(0, 0),
                        child: TextFormField(
                          controller: _passwordController,
                          obscureText: !passwordVisibility,
                          decoration: InputDecoration(
                            hintText: 'Հին գաղտնաբառը',
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromRGBO(235, 235, 232, 1),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(7),
                              ),
                            ),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00FFFFFF),
                                width: 2,
                              ),
                            ),
                            filled: true,
                            fillColor: Color(0xFFEBECE7),
                            suffixIcon: InkWell(
                              onTap: () => setState(
                                () => passwordVisibility = !passwordVisibility,
                              ),
                              child: Icon(
                                passwordVisibility
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                                size: 18,
                              ),
                            ),
                          ),
                          style: const TextStyle(
                            fontFamily: 'Lato',
                            color: Color(0xFF757575),
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 27),
                child: Container(
                  width: 237,
                  height: 40,
                  child: Stack(
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(0, 0),
                        child: TextFormField(
                          controller: _passwordTwoController,
                          obscureText: !passwordVisibilityTwo,
                          decoration: InputDecoration(
                            hintText: 'Նոր գաղտնաբառը',
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromRGBO(235, 235, 232, 1),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(7),
                              ),
                            ),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00FFFFFF),
                                width: 2,
                              ),
                            ),
                            filled: true,
                            fillColor: Color(0xFFEBECE7),
                            suffixIcon: InkWell(
                              onTap: () => setState(
                                () => passwordVisibilityTwo =
                                    !passwordVisibilityTwo,
                              ),
                              child: Icon(
                                passwordVisibilityTwo
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                                size: 18,
                              ),
                            ),
                          ),
                          style: const TextStyle(
                            fontFamily: 'Lato',
                            color: Color(0xFF757575),
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
                child: Container(
                  width: 237,
                  height: 40,
                  child: Stack(
                    children: [
                      Align(
                        alignment: const AlignmentDirectional(0, 0),
                        child: TextFormField(
                          controller: _passwordthreeController,
                          obscureText: !passwordVisibilityThree,
                          decoration: InputDecoration(
                            hintText: 'Կրնկնել նոր գաղտնաբառը',
                            enabledBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromRGBO(235, 235, 232, 1),
                                width: 2,
                              ),
                              borderRadius: BorderRadius.all(
                                Radius.circular(7),
                              ),
                            ),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00FFFFFF),
                                width: 2,
                              ),
                            ),
                            filled: true,
                            fillColor: Color(0xFFEBECE7),
                            suffixIcon: InkWell(
                              onTap: () => setState(
                                () => passwordVisibilityThree =
                                    !passwordVisibilityThree,
                              ),
                              child: Icon(
                                passwordVisibilityThree
                                    ? Icons.visibility_outlined
                                    : Icons.visibility_off_outlined,
                                size: 18,
                              ),
                            ),
                          ),
                          style: const TextStyle(
                            fontFamily: 'Lato',
                            color: Color(0xFF757575),
                            fontSize: 16,
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
    );

    double width = MediaQuery.of(context).size.width;

    return Scaffold(body: BlocBuilder<ListBloc, ListState>(
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

        if (state is FetchSuccses) {
          return SingleChildScrollView(
            child: Container(
              decoration:
                  BoxDecoration(color: Color.fromRGBO(247, 247, 247, 1)),
              child: Column(
                children: [
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 18, top: 50),
                          child: TextButton(
                            child: const Text(
                              "Դուրս գալ",
                              style: TextStyle(
                                fontFamily: 'Poppins',
                                color: Color.fromRGBO(12, 128, 64, 1),
                                fontSize: 18,
                                decoration: TextDecoration.underline,
                                decorationThickness: 2.5,
                              ),
                            ),
                            onPressed: () async {
                              FlutterSession token =
                                  await FlutterSession().get('token');
                              token.prefs.remove("token");

                              // Navigator.pushNamedAndRemoveUntil(context, '/login', (_) => false);
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => LoginScreen(
                                      userRepository: UserRepository())));
                            },
                          ),
                        ),
                      ],
                    ),
                    width: width,
                    height: 125,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/profile.png"),
                            fit: BoxFit.cover)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 0),
                    child: Stack(
                      children: [
                        image != null
                            ? ClipOval(
                                child: Image.file(
                                  image!,
                                  width: 160,
                                  height: 160,
                                  fit: BoxFit.cover,
                                ),
                              )
                            : ClipOval(
                                // get bloc image value

                                child: Image.asset("assets/profile.jpg",
                                    width: 160,
                                    height: 160,
                                    fit: BoxFit.cover)),
                        Positioned(
                          bottom: 10,
                          right: 10,
                          child: CircleAvatar(
                            backgroundColor:
                                const Color.fromRGBO(255, 255, 255, 1),
                            child: IconButton(
                              onPressed: () {
                                pickerImage();
                              },
                              icon: SvgPicture.asset("assets/icon/camera.svg"),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Stack(
                    children: [
                      Align(
                          alignment: const AlignmentDirectional(0, 0),
                          child: Padding(
                              padding: const EdgeInsets.only(top: 22),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 22),
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
                                                  color: Color.fromRGBO(
                                                      0, 0, 0, 1),
                                                  fontSize: 18,
                                                )),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 0),
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
                                            child: Text('Անուն Ազգաունուն',
                                                style: TextStyle(
                                                  fontFamily: 'Poppins',
                                                  color: Color.fromRGBO(
                                                      183, 183, 183, 1),
                                                  fontSize: 14,
                                                )),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 22),
                                    child: Container(
                                      width: 288,
                                      height: 40,
                                      child: Stack(
                                        children: [
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(
                                                    0, 0),
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
                                                    borderRadius:
                                                        BorderRadius.all(
                                                            Radius.circular(
                                                                22))),
                                                hintText: 'Անուն Ազգանուն',
                                                enabledBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0x00FFFFFF),
                                                    width: 2,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.all(
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
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 0),
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
                                            child: Text('Հեռախոսահամար',
                                                style: TextStyle(
                                                  fontFamily: 'Poppins',
                                                  color: Color.fromRGBO(
                                                      183, 183, 183, 1),
                                                  fontSize: 14,
                                                )),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Column(
                                      children: List.generate(
                                    listNumbers.length,
                                    (index) {
                                      return ProfileNumbers();
                                    },
                                  )),

                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 37),
                                    child: Container(
                                      width: 288,
                                      height: 40,
                                      child: Stack(
                                        children: [
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(
                                              -1,
                                              0,
                                            ),
                                            child: InkWell(
                                              onTap: () {
                                                setState(() {
                                                  listNumbers
                                                      .add(ProfileNumbers());
                                                });
                                              },
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    flex: 1,
                                                    child: SvgPicture.asset(
                                                      "assets/icon/+.svg",
                                                      height: 13,
                                                    ),
                                                  ),
                                                  const Expanded(
                                                    flex: 10,
                                                    child: Text(
                                                        'Ավելացնել նոր հեռախոսահամր',
                                                        style: TextStyle(
                                                          fontFamily: 'Poppins',
                                                          color: Color.fromRGBO(
                                                              12, 128, 64, 1),
                                                          fontSize: 11,
                                                        )),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Column(
                                      children: List.generate(
                                    listCarData.length,
                                    (index) {
                                      return ProfileCarData();
                                    },
                                  )),
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 33),
                                    child: Container(
                                      width: 288,
                                      height: 40,
                                      child: Stack(
                                        children: [
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(
                                              -1,
                                              0,
                                            ),
                                            child: InkWell(
                                              onTap: () {
                                                setState(() {
                                                  listCarData
                                                      .add(ProfileCarData());
                                                });
                                              },
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    flex: 1,
                                                    child: SvgPicture.asset(
                                                      "assets/icon/+.svg",
                                                      height: 13,
                                                    ),
                                                  ),
                                                  Expanded(
                                                    flex: 10,
                                                    child: Text(
                                                        'Ավելացնել նոր մեքենա',
                                                        style: TextStyle(
                                                          fontFamily: 'Poppins',
                                                          color: Color.fromRGBO(
                                                              12, 128, 64, 1),
                                                          fontSize: 11,
                                                        )),
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
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 0),
                                    child: Container(
                                      width: 288,
                                      height: 40,
                                      child: Stack(
                                        children: [
                                          Align(
                                              alignment:
                                                  const AlignmentDirectional(
                                                -1,
                                                0,
                                              ),
                                              child: TextButton(
                                                child: const Text(
                                                  "Փոխել գաղտնաբառը",
                                                  style: TextStyle(
                                                    decoration: TextDecoration
                                                        .underline,
                                                    fontSize: 16,
                                                    color: Color.fromRGBO(
                                                        12, 128, 64, 1),
                                                  ),
                                                ),
                                                onPressed: () {
                                                  showDialog(
                                                      barrierColor:
                                                          Color.fromARGB(
                                                              38, 38, 38, 1),
                                                      context: context,
                                                      builder: (context) {
                                                        return alert;
                                                      });
                                                },
                                              )),
                                        ],
                                      ),
                                    ),
                                  ),
                                  // Padding(
                                  //   padding:
                                  //       const EdgeInsetsDirectional.fromSTEB(
                                  //           0, 0, 0, 10),
                                  //   child: Container(
                                  //     width: 288,
                                  //     height: 22,
                                  //     child: Stack(
                                  //       children: const [
                                  //         Align(
                                  //           alignment: AlignmentDirectional(
                                  //             -1,
                                  //             0,
                                  //           ),
                                  //           child: Text('Գաղտնաբառ',
                                  //               style: TextStyle(
                                  //                 fontFamily: 'Poppins',
                                  //                 color: Color.fromRGBO(
                                  //                     0, 0, 0, 1),
                                  //                 fontSize: 18,
                                  //               )),
                                  //         ),
                                  //       ],
                                  //     ),
                                  //   ),
                                  // ),

                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 26, 0, 31),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                            primary:
                                                Color.fromRGBO(159, 205, 79, 1),

                                            elevation: 0,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10.0)),
                                            minimumSize:
                                                Size(151, 36), //////// HERE
                                          ),
                                          onPressed: () {
                                            onProfileEditButtonPressed(
                                              _imageController.text,
                                              _fullNameController.text,
                                              listNumbers,
                                              listCarData,
                                              isCheckedOne,
                                              isCheckedTwo,
                                              isCheckedThree,
                                              isCheckedFour,
                                            );
                                          },
                                          child: const Text('Հաստատել',
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
                                ],
                              )))
                    ],
                  ),
                ],
              ),
            ),
          );
        }
        return const Center(child: CircularProgressIndicator());
      },
    ));
  }
}
