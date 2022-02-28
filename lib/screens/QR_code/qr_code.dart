import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_session/flutter_session.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;
import 'package:login_register_token/bloc/QRCounterAndReason/bloc/qr_counter_reason_bloc.dart';
import 'package:login_register_token/bloc/QrCodeSend/bloc/qr_send_bloc.dart';
import 'package:login_register_token/repository.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../bloc/Auth_Bloc/bloc/auth_bloc.dart';
import '../Menu/Home/Home.dart';
import 'CounterQR.dart';

class QrCode extends StatefulWidget {
  const QrCode({Key? key}) : super(key: key);

  @override
  _QrCodeState createState() => _QrCodeState();
}

const String base_url = 'https://phpstack-351614-1150808.cloudwaysapps.com';
const String urlQR = base_url + "/api/bag/exists";

class _QrCodeState extends State<QrCode> {
  final qrKey = GlobalKey(debugLabel: "QR");
  QRViewController? controller;
  Barcode? barcode;
  bool hideChack = false;
  int counter = 0;
  List<String> resultList = [];
  bool iconChange = false;
  var string = "Hello";

  @override
  void dispose() {
    super.dispose();
    controller?.dispose();
  }

  @override
  void reassemble() async {
    super.reassemble();
    try {
      if (Platform.isAndroid) {
        // await controller!.pauseCamera();
      } else if (Platform.isIOS) {
        await controller?.resumeCamera();
      }
      controller?.resumeCamera();
    } catch (e) {
      print("error try");
    }
  }

  _onQrCodeSendButtonPressed(String barCode) {
    if (resultList.length > 1) {
      print("messssssssssss lenght ${barcode}");
      setState(() {
        iconChange = true;
      });
      print(iconChange);
    }

    BlocProvider.of<QrSendBloc>(context).add(
      QrSendButtonPressed(
        qrSendCode: barCode,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Color.fromRGBO(232, 232, 232, 1)),
        child: Center(
          child: Column(children: [
            const Padding(
              padding: EdgeInsets.only(top: 100, bottom: 19),
              child: Text(
                "Qr  code  scan",
                style: TextStyle(
                  fontSize: 22,
                  color: Color.fromRGBO(0, 0, 0, 1),
                ),
              ),
            ),
            Container(
              height: 288,
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Stack(
                  alignment: Alignment.center,
                  children: <Widget>[
                    hideChack != false
                        ? buildQrCode(context)
                        : const Text("data"),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ButtonScanQR(),
                  ButtonSendQR(),
                ],
              ),
            ),
          ]),
        ),
      ),
    ));
  }

  // Widget buildResult() => Container(
  //       padding: EdgeInsets.all(12),
  //       decoration: BoxDecoration(
  //           color: Colors.white12, borderRadius: BorderRadius.circular(8)),
  //       child: Text(
  //         barcode != null ? "Result: ${sum}" : "Scan Code",
  //         maxLines: 10,
  //       ),
  //     );
  Widget ButtonSendQR() => IconButton(
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (contet) => BlocProvider(
            create: (context) => QrCounterReasonBloc(
                authenticationBloc: BlocProvider.of<AuthBloc>(context),
                userRepository: UserRepository()),
            child: CounterQR(
              counter: counter,
            ),
          ),
        ));
      }, //sendQrCode("123", context),
      icon: iconChange == false
          ? SvgPicture.asset(
              "assets/icon/next.svg",
              height: 35,
            )
          : SvgPicture.asset(
              "assets/icon/arrow.svg",
              height: 35,
            ));

  Widget ButtonScanQR() => IconButton(
      onPressed: () {
        setState(() {
          if (hideChack == false) {
            hideChack = true;
          } else if (hideChack == true) {
            hideChack = false;
          }
        });
      },
      icon: SvgPicture.asset(
        "assets/icon/+.svg",
        height: 35,
      ));
  Widget buildQrCode(BuildContext context) => QRView(
        key: qrKey,
        onQRViewCreated: onQRViewCreated,
        overlay: QrScannerOverlayShape(
          borderColor: Color.fromRGBO(112, 112, 112, 1),
          borderRadius: 0,
          borderLength: 19,
          borderWidth: 2,
          cutOutSize: MediaQuery.of(context).size.width * 0.7,
        ),
      );

  void onQRViewCreated(QRViewController controller) {
    controller.scannedDataStream.listen((event) async => setState(() {
          barcode = event;

          setState(() {
            if (barcode!.code!.isNotEmpty || barcode!.code != null) {
              controller.pauseCamera();
              resultList.add(barcode!.code.toString());

              print("resultList  $resultList");
              // _onQrCodeSendButtonPressed(barcode!.code.toString());

              print("barcode.code ${barcode!.code.toString()}");
              hideChack = false;
              iconChange = true;
              counter++;
              print("counter-----------------------------  $counter");
            }
          });
        }));

    setState(() => this.controller = controller);
  }
}
