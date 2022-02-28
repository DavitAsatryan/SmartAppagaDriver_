part of 'qr_counter_reason_bloc.dart';

abstract class QrCounterReasonState extends Equatable {
  const QrCounterReasonState();

  @override
  List<Object> get props => [];
}

class QrCounterReasonInitial extends QrCounterReasonState {}

class QrCounterReasonLoading extends QrCounterReasonState {}

class QrCounterReasonFailure extends QrCounterReasonState {
  final String error;

  const QrCounterReasonFailure({required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'QrCounterReasonFailure { error: $error }';
}
