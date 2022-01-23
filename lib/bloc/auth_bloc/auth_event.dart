part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class LoginBegin extends AuthEvent {
  final User user;
  LoginBegin({ required this.user });
}

class RegisterBegin extends AuthEvent {
  final User user;
  RegisterBegin({ required this.user });
}