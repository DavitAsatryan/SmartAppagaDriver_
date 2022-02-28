import 'package:flutter/material.dart';

class ProfileCarData extends StatefulWidget {
  ProfileCarData({Key? key}) : super(key: key);

  @override
  State<ProfileCarData> createState() => _ProfileCarDataState();
}

class _ProfileCarDataState extends State<ProfileCarData> {
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

  final _carNumberController = TextEditingController();

  final _carNameController = TextEditingController();

  final _carColorController = TextEditingController();

  bool isCheckedOne = false;

  bool isCheckedTwo = false;

  bool isCheckedThree = false;

  bool isCheckedFour = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 22),
          child: Container(
            width: 288,
            height: 50,
            child: Stack(
              children: const [
                Align(
                  alignment: AlignmentDirectional(
                    -1,
                    0,
                  ),
                  child: Text('Մեքենայի տվեալներ',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Color.fromRGBO(0, 0, 0, 1),
                        fontSize: 18,
                      )),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
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
                  child: Text('Մեքենայի համարանիշը',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Color.fromRGBO(183, 183, 183, 1),
                        fontSize: 14,
                      )),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 22),
          child: Container(
            width: 288,
            height: 50,
            child: Stack(
              children: [
                Align(
                  alignment: const AlignmentDirectional(0, 0),
                  child: TextFormField(
                    style: const TextStyle(
                      fontFamily: 'Lato',
                      color: Color.fromRGBO(169, 169, 169, 1),
                      fontSize: 16,
                    ),
                    controller: _carNumberController,
                    obscureText: false,
                    decoration: const InputDecoration(
                      hintText: 'Մեքենայի Համարանիշ',
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00FFFFFF),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                      focusedBorder: InputBorder.none,
                      filled: true,
                      fillColor: Color.fromRGBO(235, 235, 232, 1),
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
            width: 288,
            height: 40,
            child: Stack(
              children: const [
                Align(
                  alignment: AlignmentDirectional(
                    -1,
                    0,
                  ),
                  child: Text('Մեքենայի մակնիշը',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Color.fromRGBO(183, 183, 183, 1),
                        fontSize: 14,
                      )),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 22),
          child: Container(
            width: 288,
            height: 50,
            child: Stack(
              children: [
                Align(
                  alignment: const AlignmentDirectional(0, 0),
                  child: TextFormField(
                    style: const TextStyle(
                      fontFamily: 'Lato',
                      color: Color.fromRGBO(169, 169, 169, 1),
                      fontSize: 16,
                    ),
                    controller: _carNameController,
                    obscureText: false,
                    decoration: const InputDecoration(
                      hintText: 'Մեքենայի Մակնիշ',
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color(0x00FFFFFF),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                      focusedBorder: InputBorder.none,
                      filled: true,
                      fillColor: Color.fromRGBO(235, 235, 232, 1),
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
            width: 288,
            height: 40,
            child: Stack(
              children: const [
                Align(
                  alignment: AlignmentDirectional(
                    -1,
                    0,
                  ),
                  child: Text('Մեքենայի գույնը ',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        color: Color.fromRGBO(183, 183, 183, 1),
                        fontSize: 14,
                      )),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 30),
          child: Container(
            width: 288,
            height: 50,
            child: Stack(
              children: [
                Align(
                  alignment: const AlignmentDirectional(0, 0),
                  child: TextFormField(
                    style: const TextStyle(
                      fontFamily: 'Lato',
                      color: Color.fromRGBO(169, 169, 169, 1),
                      fontSize: 16,
                    ),
                    controller: _carColorController,
                    obscureText: false,
                    decoration: const InputDecoration(
                      hintText: 'Մեքենայի Գույն',
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                          color: Color.fromRGBO(235, 235, 232, 1),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                      ),
                      focusedBorder: InputBorder.none,
                      filled: true,
                      fillColor: Color(0xFFEBECE7),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        //dddd
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 0),
          child: Container(
            width: 288,
            height: 242,
            child: Stack(
              children: [
                Align(
                  alignment: const AlignmentDirectional(-1, 0),
                  child: Container(
                    width: 310,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromRGBO(235, 235, 232, 1),
                    ),
                    height: 400,
                    child: Column(
                      children: [
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 11, 0, 0),
                          child: Container(
                            width: 288,
                            height: 20,
                            child: Stack(
                              children: const [
                                Align(
                                  alignment: AlignmentDirectional(
                                    -1,
                                    0,
                                  ),
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 11),
                                    child: Text('Մեքենայի Տարողությունը',
                                        style: TextStyle(
                                          fontFamily: 'Poppins',
                                          color:
                                              Color.fromRGBO(183, 183, 183, 1),
                                          fontSize: 16,
                                        )),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 22, 0, 0),
                          child: Container(
                            width: 310,
                            height: 20,
                            child: Stack(
                              children: [
                                Align(
                                  alignment: const AlignmentDirectional(0, 0),
                                  child: Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 0),
                                    child: Container(
                                      width: 288,
                                      height: 20,
                                      child: Stack(
                                        children: [
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(
                                                    0, 0),
                                            child: Row(
                                              children: [
                                                Checkbox(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  fillColor:
                                                      MaterialStateProperty
                                                          .resolveWith(
                                                              getColor),
                                                  checkColor:
                                                      const Color.fromARGB(
                                                          255, 0, 144, 115),
                                                  value: isCheckedOne,
                                                  onChanged: (bool? value) {
                                                    setState(() {
                                                      isCheckedOne = value!;
                                                      isCheckedTwo = false;
                                                      isCheckedThree = false;
                                                      isCheckedFour = false;
                                                    });
                                                  },
                                                ),
                                                const Text("100 - 300",
                                                    style: TextStyle(
                                                      fontFamily: 'Poppins',
                                                      color: Color.fromRGBO(
                                                          167, 166, 166, 1),
                                                      fontSize: 16,
                                                    )),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 27, 0, 0),
                          child: Container(
                            width: 310,
                            height: 20,
                            child: Stack(
                              children: [
                                Align(
                                  alignment: const AlignmentDirectional(0, 0),
                                  child: Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 0),
                                    child: Container(
                                      width: 288,
                                      height: 20,
                                      child: Stack(
                                        children: [
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(
                                                    0, 0),
                                            child: Row(
                                              children: [
                                                Checkbox(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      side: const BorderSide(
                                                        width: 1,
                                                        color: const Color
                                                                .fromARGB(
                                                            202, 150, 179, 47),
                                                      )),
                                                  fillColor:
                                                      MaterialStateProperty
                                                          .resolveWith(
                                                              getColor),
                                                  checkColor:
                                                      const Color.fromARGB(
                                                          255, 0, 144, 115),
                                                  value: isCheckedTwo,
                                                  onChanged: (bool? value) {
                                                    setState(() {
                                                      isCheckedTwo = value!;
                                                      isCheckedFour = false;
                                                      isCheckedThree = false;
                                                      isCheckedOne = false;
                                                    });
                                                  },
                                                ),
                                                const Text("300 - 500",
                                                    style: TextStyle(
                                                      fontFamily: 'Poppins',
                                                      color: Color.fromRGBO(
                                                          167, 166, 166, 1),
                                                      fontSize: 16,
                                                    )),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 27, 0, 0),
                          child: Container(
                            width: 288,
                            height: 20,
                            child: Stack(
                              children: [
                                Align(
                                  alignment: const AlignmentDirectional(0, 0),
                                  child: Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 0),
                                    child: Container(
                                      width: 288,
                                      height: 20,
                                      child: Stack(
                                        children: [
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(
                                                    0, 0),
                                            child: Row(
                                              children: [
                                                Checkbox(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  fillColor:
                                                      MaterialStateProperty
                                                          .resolveWith(
                                                              getColor),
                                                  checkColor:
                                                      const Color.fromARGB(
                                                          255, 0, 144, 115),
                                                  value: isCheckedThree,
                                                  onChanged: (bool? value) {
                                                    setState(() {
                                                      isCheckedThree = value!;
                                                      isCheckedOne = false;
                                                      isCheckedTwo = false;
                                                      isCheckedFour = false;
                                                    });
                                                  },
                                                ),
                                                const Text("500 - 800",
                                                    style: TextStyle(
                                                      fontFamily: 'Poppins',
                                                      color: Color.fromRGBO(
                                                          167, 166, 166, 1),
                                                      fontSize: 16,
                                                    )),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsetsDirectional.fromSTEB(0, 27, 0, 0),
                          child: Container(
                            width: 288,
                            height: 20,
                            child: Stack(
                              children: [
                                Align(
                                  alignment: const AlignmentDirectional(0, 0),
                                  child: Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 0, 0),
                                    child: Container(
                                      width: 288,
                                      height: 20,
                                      child: Stack(
                                        children: [
                                          Align(
                                            alignment:
                                                const AlignmentDirectional(
                                                    0, 0),
                                            child: Row(
                                              children: [
                                                Checkbox(
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  fillColor:
                                                      MaterialStateProperty
                                                          .resolveWith(
                                                              getColor),
                                                  checkColor:
                                                      const Color.fromARGB(
                                                          255, 0, 144, 115),
                                                  value: isCheckedFour,
                                                  onChanged: (bool? value) {
                                                    setState(() {
                                                      isCheckedFour = value!;
                                                      isCheckedOne = false;
                                                      isCheckedTwo = false;
                                                      isCheckedThree = false;
                                                    });
                                                  },
                                                ),
                                                const Text("1000 և ավել",
                                                    style: TextStyle(
                                                      fontFamily: 'Poppins',
                                                      color: Color.fromRGBO(
                                                          167, 166, 166, 1),
                                                      fontSize: 16,
                                                    )),
                                              ],
                                            ),
                                          ),
                                        ],
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
              ],
            ),
          ),
        ),
      ],
    );
  }
}
