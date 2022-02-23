part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class LoginBegin extends AuthEvent {
  final User user;
  LoginBegin({required this.user});
}

class RegisterBegin extends AuthEvent {
  final User user;
  RegisterBegin({required this.user});
}

class GetUser extends AuthEvent {}

class LogoutUser extends AuthEvent {}

class ChangePassword extends AuthEvent {
  final String currentPassword;
  final String confPassword;
  final String newPassword;
  ChangePassword({
    required this.currentPassword,
    required this.confPassword,
    required this.newPassword,
  });
}

class UpdateUser extends AuthEvent {
  final String? fname;
  final String? lname;
  final int? phone;
  final File? image;
  UpdateUser({
    this.fname,
    this.lname,
    this.phone = 0,
    this.image,
  });
}
