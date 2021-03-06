part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final User user;
  AuthSuccess({required this.user});

  @override
  List<Object?> get props => [user];
}

class AuthFailed extends AuthState {
  final String message;
  AuthFailed({required this.message});

  @override
  List<Object?> get props => [message];
}

class RegisterSuccess extends AuthState {
  final String message;
  RegisterSuccess({required this.message});

  @override
  List<Object?> get props => [message];
}

class NoUser extends AuthState {}

class LoggedOut extends AuthState {}

class PasswordChanged extends AuthState {
  final String message;
  PasswordChanged({required this.message});

  @override
  List<Object?> get props => [message];
}

class ProfileUpdated extends AuthState {
  final String message;
  ProfileUpdated({required this.message});

  @override
  List<Object?> get props => [message];
}
