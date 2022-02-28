part of 'notification_bloc.dart';

@immutable
abstract class NotificationState {}

class NotificationInitial extends NotificationState {}

class NotificationLoading extends NotificationState {}

class NotificationLoaded extends NotificationState {
  final List<Notification> notif;
  NotificationLoaded({
    required this.notif,
  });

  @override
  List<Object?> get props => [notif];
}

class NotificationLoadFailed extends NotificationState {
  final String message;
  NotificationLoadFailed({
    required this.message,
  });

  @override
  List<Object?> get props => [message];
}
