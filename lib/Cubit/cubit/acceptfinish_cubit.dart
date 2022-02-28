import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'acceptfinish_state.dart';

class AcceptfinishCubit extends Cubit<AcceptFinishState> {
  AcceptfinishCubit() : super(AcceptFinishState(acceptFinishCubit: "Վերցնել"));

  void acceptFinishMetod(String text) {
    print("print cubit text $text");
    emit(AcceptFinishState(acceptFinishCubit: text));
  }
}
