part of 'filtr_bloc.dart';

abstract class FiltrEvent extends Equatable {
  const FiltrEvent();

  @override
  List<Object> get props => [];
}

class FiltrUnassignedButtonPressed extends FiltrEvent {
  final String unassignedText;

  const FiltrUnassignedButtonPressed({
    required this.unassignedText,
  });

  @override
  List<Object> get props => [unassignedText];

  @override
  String toString() => 'FiltrButtonPressed {Confirm: $unassignedText }';
}

class FiltrAssignedButtonPressed extends FiltrEvent {
  final String assignedText;

  const FiltrAssignedButtonPressed({
    required this.assignedText,
  });

  @override
  List<Object> get props => [assignedText];

  @override
  String toString() => 'FiltrAssignedButtonPressed {Confirm: $assignedText }';
}

class FiltrCanceledButtonPressed extends FiltrEvent {
  final String canceledText;

  const FiltrCanceledButtonPressed({
    required this.canceledText,
  });

  @override
  List<Object> get props => [canceledText];

  @override
  String toString() => 'FiltrCanceledButtonPressed {Confirm: $canceledText }';
}

class FiltrCompletedButtonPressed extends FiltrEvent {
  final String completedText;

  const FiltrCompletedButtonPressed({
    required this.completedText,
  });

  @override
  List<Object> get props => [completedText];

  @override
  String toString() => 'FiltrCompletedButtonPressed {Confirm: $completedText }';
}

class FiltrIncompleteButtonPressed extends FiltrEvent {
  final String incompleteText;

  const FiltrIncompleteButtonPressed({
    required this.incompleteText,
  });

  @override
  List<Object> get props => [incompleteText];

  @override
  String toString() =>
      'FiltrIncompleteButtonPressed {Confirm: $incompleteText }';
}

class FiltrMissedButtonPressed extends FiltrEvent {
  final String missedText;

  const FiltrMissedButtonPressed({
    required this.missedText,
  });

  @override
  List<Object> get props => [missedText];

  @override
  String toString() => 'FiltrMissedButtonPressed {Confirm: $missedText }';
}
