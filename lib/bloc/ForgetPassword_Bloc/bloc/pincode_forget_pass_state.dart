part of 'pincode_forget_pass_bloc.dart';

abstract class PincodeForgetPassState extends Equatable {
  const PincodeForgetPassState();

  @override
  List<Object> get props => [];
}

class PincodeForgetPassInitial extends PincodeForgetPassState {}

class ForgetPinCodeLoading extends PincodeForgetPassState {}

class ForgetPinCodeFailure extends PincodeForgetPassState {
  final String error;

  const ForgetPinCodeFailure({required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'ForgetPinCodeFailure { error: $error }';
}
