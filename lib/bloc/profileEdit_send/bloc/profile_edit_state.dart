part of 'profile_edit_bloc.dart';

abstract class ProfileEditState extends Equatable {
  const ProfileEditState();

  @override
  List<Object> get props => [];
}

class ProfileEditInitial extends ProfileEditState {}

class ProfileEditLoading extends ProfileEditState {}

class ProfileEditFailure extends ProfileEditState {
  final String error;

  const ProfileEditFailure({required this.error});

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'ProfileEditFailure { error: $error }';
}
