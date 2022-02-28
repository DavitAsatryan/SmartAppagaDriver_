part of 'order_bloc.dart';

abstract class ListEvent extends Equatable {
  const ListEvent();

  @override
  List<Object> get props => [];
}

class FetchEvent extends ListEvent {}

class SectionButtonPressed extends ListEvent {
  final List<String> section;

  const SectionButtonPressed({
    required this.section,
  });

  @override
  List<Object> get props => [section];

  @override
  String toString() => 'SectionButtonPressed {Section: $section }';
}

class UnassignedEvent extends ListEvent {}

class AssignedEvent extends ListEvent {}

class CanceledEvent extends ListEvent {}

class CompletedEvent extends ListEvent {}

class IncompleteEvent extends ListEvent {}

class MissedEvent extends ListEvent {}
