part of 'forget_password_new_bloc.dart';

abstract class ForgetPasswordNewEvent extends Equatable {
  const ForgetPasswordNewEvent();

  @override
  List<Object> get props => [];
}

class ButtonForgetPasswordNew extends ForgetPasswordNewEvent {
  final String passwordText;
  final String passwordTwoText;

  const ButtonForgetPasswordNew(
      {required this.passwordText, required this.passwordTwoText});

  @override
  List<Object> get props => [passwordText, passwordTwoText];

  @override
  String toString() =>
      'ButtonForgetPasswordNew {passwordText: $passwordText,passwordTwoText: $passwordTwoText  }';
}
