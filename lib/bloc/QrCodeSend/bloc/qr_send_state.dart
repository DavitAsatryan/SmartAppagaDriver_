part of 'qr_send_bloc.dart';

abstract class QrSendState extends Equatable {
  const QrSendState();

  @override
  List<Object> get props => [];
}

class QrSendInitial extends QrSendState {}

class QrSendLoading extends QrSendState {}

class QrSendFailure extends QrSendState {
  final String error;

  const QrSendFailure({required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'QrSendFailure { error: $error }';
}
