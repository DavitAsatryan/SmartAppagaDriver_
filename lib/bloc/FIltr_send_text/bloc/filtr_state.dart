part of 'filtr_bloc.dart';

abstract class FiltrState extends Equatable {
  const FiltrState();

  @override
  List<Object> get props => [];
}

class FiltrInitial extends FiltrState {}

class FiltrLoading extends FiltrState {}

class FiltrFailure extends FiltrState {
  final String error;

  const FiltrFailure({required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'FiltrFailure { error: $error }';
}
