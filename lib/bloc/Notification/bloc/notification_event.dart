part of 'notification_bloc.dart';

abstract class NotificationEvent extends Equatable {
  const NotificationEvent();

  @override
  List<Object> get props => [];
}

class NotificationFetchEvent extends NotificationEvent {}

class NotificationDelete extends NotificationEvent {
  List<int> id;
  NotificationDelete({required this.id}) {}
}
