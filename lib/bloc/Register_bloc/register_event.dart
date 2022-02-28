part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class RegisternButtonPressed extends RegisterEvent {
  final String fullname;
  final String phoneNumber;
  final String email;
  final String password;

  const RegisternButtonPressed({
    required this.fullname,
    required this.phoneNumber,
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [fullname, phoneNumber, email, password];

  @override
  String toString() =>
      'RegisternButtonPressed { email: $email, password: $password, phoneNumber: $phoneNumber, fullname: $fullname }';
}
