import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movie_review/data/models/user_model.dart';
import 'package:movie_review/data/repositories/user_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  UserRepository _userRepository = UserRepository();

  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) {});
    on<LoginBegin>((event, emit) => login(event, emit));
  }

  Future<void> login(LoginBegin event, Emitter<AuthState> emit) async {
    try {
      emit(AuthLoading());
      User user = await _userRepository.login(event.user);
      emit(AuthSuccess(user: user));
    } catch (e) {
      emit(AuthFailed(message: e.toString()));
    }
  }
}
