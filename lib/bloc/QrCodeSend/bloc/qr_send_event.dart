part of 'qr_send_bloc.dart';

abstract class QrSendEvent extends Equatable {
  const QrSendEvent();

  @override
  List<Object> get props => [];
}

class QrSendButtonPressed extends QrSendEvent {
  final String qrSendCode;

  const QrSendButtonPressed({
    required this.qrSendCode,
  });

  @override
  List<Object> get props => [qrSendCode];

  @override
  String toString() => 'qrSendButtonPressed {qrSend: $qrSendCode }';
}
