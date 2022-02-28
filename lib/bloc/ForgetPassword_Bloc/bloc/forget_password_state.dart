part of 'forget_password_bloc.dart';

abstract class ForgetPasswordState extends Equatable {
  const ForgetPasswordState();

  @override
  List<Object> get props => [];
}

class ForgetPasswordInitial extends ForgetPasswordState {}

class ForgetPasswordLoading extends ForgetPasswordState {}

class ForgetPasswordFailure extends ForgetPasswordState {
  final String error;

  const ForgetPasswordFailure({required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'ForgetPasswordFailure { error: $error }';
}

//pinCOde
