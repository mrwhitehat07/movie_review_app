part of 'internet_bloc.dart';

@immutable
abstract class InternetEvent {}


class CheckInternet extends InternetEvent {}

class ConnectionChanged extends InternetEvent {
  final InternetState connection;
  ConnectionChanged(this.connection);
}