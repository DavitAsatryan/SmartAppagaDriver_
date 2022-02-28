part of 'forget_password_bloc.dart';

abstract class ForgetPasswordEvent extends Equatable {
  const ForgetPasswordEvent();

  @override
  List<Object> get props => [];
}

class ButtonPhoneNumber extends ForgetPasswordEvent {
  final String phoneNumberText;

  const ButtonPhoneNumber({
    required this.phoneNumberText,
  });

  @override
  List<Object> get props => [phoneNumberText];

  @override
  String toString() => 'ButtonPhoneNumber {phoneNumber: $phoneNumberText }';
}
