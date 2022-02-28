part of 'confirm_bloc.dart';

abstract class ConfirmEvent extends Equatable {
  const ConfirmEvent();

  @override
  List<Object> get props => [];
}

class ConfirmButtonPressed extends ConfirmEvent {
  final String confirmText;

  const ConfirmButtonPressed({
    required this.confirmText,
  });

  @override
  List<Object> get props => [confirmText];

  @override
  String toString() => 'ConfirmButtonPressed {Confirm: $confirmText }';
}
