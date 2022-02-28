part of 'password_change_bloc.dart';

abstract class PasswordChangeEvent extends Equatable {
  const PasswordChangeEvent();

  @override
  List<Object> get props => [];
}

class PasswordChangeButtonPressed extends PasswordChangeEvent {
  final String password;
  final String newPassword;
  final String newPasswordTwo;

  PasswordChangeButtonPressed({
    required this.password,
    required this.newPassword,
    required this.newPasswordTwo,
  });

  @override
  List<Object> get props => [password, newPassword, newPasswordTwo];

  @override
  String toString() =>
      'PasswordChangeButtonPressed { $password, $newPassword, $newPasswordTwo }';
}
