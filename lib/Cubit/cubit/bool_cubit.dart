import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bool_state.dart';

class BoolCubit extends Cubit<BoolState> {
  BoolCubit() : super(BoolState(isSaveChack: false));
  // {
  //   _controllerSink.stream.listen(activePassive);
  // }

  bool isChacked = false;

  void activePassive(bool isBool) {
    print("isBool___cubit $isBool");
    // ControllerClass().checkStream;
    //_controllerStream.sink.add(isChacked);
    emit(BoolState(
      isSaveChack: isBool,
    ));
  }

  // var _controllerSink = StreamController<bool>();
  // StreamSink<bool> get controllerSink => _controllerSink.sink;

  // var _controllerStream = StreamController<bool>();
  // Stream<bool> get controllerStream => _controllerStream.stream;

  // void _SinkEvent(bool boolValue) {
  //   isChacked = boolValue;

  //   print("bloc $isChacked");

  // }
}

// class ControllerClass {
//   var boolCubit = BoolCubit();
//   Stream<bool> get checkStream async* {
//     print("isChacked stream + ${boolCubit.isChacked}");

//     yield boolCubit.isChacked;
//   }

//   ControllerClass() {
//     checkStream.listen((event) {
//       controllerStream.add(boolCubit.isChacked);
//     });
//   }
// }
