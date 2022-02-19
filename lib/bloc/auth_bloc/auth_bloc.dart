import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_review/data/models/user_model.dart';
import 'package:movie_review/data/repositories/secure_storage.dart';
import 'package:movie_review/data/repositories/user_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  UserRepository userRepository = UserRepository();

  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) {});
    on<LoginBegin>((event, emit) => login(event, emit));
    on<RegisterBegin>((event, emit) => register(event, emit));
    on<GetUser>((event, emit) => getUser(event, emit));
    on<LogoutUser>((event, emit) => logoutUser(event, emit));
  }

  Future<void> login(LoginBegin event, Emitter<AuthState> emit) async {
    try {
      emit(AuthLoading());
      User user = await userRepository.login(event.user);
      emit(AuthSuccess(user: user));
    } catch (e) {
      emit(AuthFailed(message: e.toString()));
    }
  }

  Future<void> register(RegisterBegin event, Emitter<AuthState> emit) async {
    try {
      emit(AuthLoading());
      User user = await userRepository.register(event.user);
      emit(AuthSuccess(user: user));
    } catch (e) {
      emit(AuthFailed(message: e.toString()));
    }
  }

  Future<void> logoutUser(LogoutUser event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    await userRepository.logout();
    emit(LoggedOut());
  }

  Future<void> getUser(GetUser event, Emitter<AuthState> emit) async {
    try {
      emit(AuthLoading());
      String? token = await TokenStorage.readToken("token");
      if (token == "" || token == null) {
        emit(NoUser());
      } else {
        User user = await userRepository.getUser(token);
        emit(AuthSuccess(user: user));
      }
    } catch (e) {
      emit(AuthFailed(message: e.toString()));
    }
  }
}
