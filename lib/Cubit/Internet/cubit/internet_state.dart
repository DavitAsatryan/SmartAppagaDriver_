part of 'internet_cubit.dart';

abstract class InternetState extends Equatable {
  const InternetState();

  @override
  List<Object> get props => [];
}

class InternetLoading extends InternetState {}

class InternetConnected extends InternetState {
  final ConnectionType connectionTYpe;
  InternetConnected({required this.connectionTYpe});
}

class InternetDisconnected extends InternetState {}
