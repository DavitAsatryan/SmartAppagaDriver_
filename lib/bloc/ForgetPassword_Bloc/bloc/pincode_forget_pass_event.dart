part of 'pincode_forget_pass_bloc.dart';

abstract class PincodeForgetPassEvent extends Equatable {
  const PincodeForgetPassEvent();

  @override
  List<Object> get props => [];
}

class ButtonPinCode extends PincodeForgetPassEvent {
  final String pinCodeText;

  const ButtonPinCode({
    required this.pinCodeText,
  });

  @override
  List<Object> get props => [pinCodeText];

  @override
  String toString() => 'ButtonPinCode {pinCodeText: $pinCodeText }';
}
