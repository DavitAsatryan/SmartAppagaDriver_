part of 'password_change_bloc.dart';

abstract class PasswordChangeState extends Equatable {
  const PasswordChangeState();

  @override
  List<Object> get props => [];
}

class PasswordChangeInitial extends PasswordChangeState {}

class PasswordChangeLoading extends PasswordChangeState {}

class PasswordChangeFailure extends PasswordChangeState {
  final String error;

  const PasswordChangeFailure({required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'PasswordChangeFailure { error: $error }';
}
