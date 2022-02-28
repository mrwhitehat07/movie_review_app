import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_review/data/models/notification_model.dart';
import 'package:movie_review/data/repositories/notification_repository.dart';

part 'notification_event.dart';
part 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  NotificationRepository notificationRepository = NotificationRepository();
  NotificationBloc() : super(NotificationInitial()) {
    on<NotificationEvent>((event, emit) {});
    on<GetNotif>((event, emit) => getNotif(event, emit));
  }

  Future<void> getNotif(GetNotif event, Emitter<NotificationState> emit) async {
    try {
      emit(NotificationLoading());
      List<Notification> notifs =
          await notificationRepository.getNotifications();
      emit(NotificationLoaded(notif: notifs));
    } catch (e) {
      emit(NotificationLoadFailed(message: e.toString()));
    }
  }
}
