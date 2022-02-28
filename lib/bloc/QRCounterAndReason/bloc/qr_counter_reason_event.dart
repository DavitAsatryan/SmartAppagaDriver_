part of 'qr_counter_reason_bloc.dart';

abstract class QrCounterReasonEvent extends Equatable {
  const QrCounterReasonEvent();

  @override
  List<Object> get props => [];
}

class QrCounterReasonButtonPressed extends QrCounterReasonEvent {
  final String checkbox;
  final String counter;
  final String reason;

  const QrCounterReasonButtonPressed({
    required this.checkbox,
    required this.counter,
    required this.reason,
  });

  @override
  List<Object> get props => [counter, reason];

  @override
  String toString() =>
      'ConfirmButtonPressed {counter: $counter, reason: $reason, checkbox: $checkbox }';
}
