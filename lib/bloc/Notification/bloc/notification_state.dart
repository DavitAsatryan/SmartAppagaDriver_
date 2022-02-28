part of 'notification_bloc.dart';

abstract class NotificationState extends Equatable {
  const NotificationState();

  @override
  List<Object> get props => [];
}

class NotificationInitialState extends NotificationState {}

class NotificationLoadingState extends NotificationState {}

class NotificationFetchSuccses extends NotificationState {
  List<NotificationModel> notification = [];

  NotificationFetchSuccses({required this.notification});
}

class NotificationDeleeteSuccses extends NotificationState {
  List<NotificationModel> notification = [];

  NotificationDeleeteSuccses({required this.notification});
}

class NotificationErrorState extends NotificationState {
  String error;
  NotificationErrorState(this.error);
}
