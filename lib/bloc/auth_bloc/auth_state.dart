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

class NoUser extends AuthState {}

