part of 'confirm_bloc.dart';

abstract class ConfirmState extends Equatable {
  const ConfirmState();

  @override
  List<Object> get props => [];
}

class ConfirmInitial extends ConfirmState {}

class ConfirmLoading extends ConfirmState {}

class ConfirmFailure extends ConfirmState {
  final String error;

  const ConfirmFailure({required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'ConfirmFailure { error: $error }';
}
