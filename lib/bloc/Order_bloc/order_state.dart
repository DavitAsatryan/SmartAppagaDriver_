part of 'order_bloc.dart';

abstract class ListState extends Equatable {
  const ListState();

  @override
  List<Object> get props => [];
}

class InitialState extends ListState {}

class LoadingState extends ListState {}

class FetchSuccses extends ListState {
  List<OrderModel> orders = [];

  FetchSuccses({required this.orders}) {}
}

class SectionsSuccses extends ListState {
  List<OrderModel> orders = [];

  SectionsSuccses({required this.orders});
}

class UnassignedSuccses extends ListState {
  List<OrderModel> orders = [];

  UnassignedSuccses({required this.orders});
}

class AssignedSuccses extends ListState {
  List<OrderModel> orders = [];

  AssignedSuccses({required this.orders});
}

class CanceledSuccses extends ListState {
  List<OrderModel> orders = [];

  CanceledSuccses({required this.orders});
}

class CompletedSuccses extends ListState {
  List<OrderModel> orders = [];

  CompletedSuccses({required this.orders});
}

class IncompleteSuccses extends ListState {
  List<OrderModel> orders = [];

  IncompleteSuccses({required this.orders});
}

class MissedSuccses extends ListState {
  List<OrderModel> orders = [];

  MissedSuccses({required this.orders});
}

class ErrorState extends ListState {
  String error;
  ErrorState(this.error);
}
