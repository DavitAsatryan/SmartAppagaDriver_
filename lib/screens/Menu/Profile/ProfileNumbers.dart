import 'package:flutter/material.dart';

class ProfileNumbers extends StatelessWidget {
  ProfileNumbers({Key? key}) : super(key: key);

  final _phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
      child: Container(
        width: 288,
        height: 40,
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
                keyboardType: TextInputType.phone,
                controller: _phoneNumberController,
                obscureText: false,
                decoration: const InputDecoration(
                  hintText: 'Հեռախոսահամար',
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
    );
  }
}
