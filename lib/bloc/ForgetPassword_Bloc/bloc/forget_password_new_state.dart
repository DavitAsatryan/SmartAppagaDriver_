part of 'forget_password_new_bloc.dart';

abstract class ForgetPasswordNewState extends Equatable {
  const ForgetPasswordNewState();

  @override
  List<Object> get props => [];
}

class ForgetPasswordNewInitial extends ForgetPasswordNewState {}

class ForgetPasswordNewLoading extends ForgetPasswordNewState {}

class ForgetPasswordNewFailure extends ForgetPasswordNewState {
  final String error;

  const ForgetPasswordNewFailure({required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'ForgetPasswordNewFailure { error: $error }';
}
