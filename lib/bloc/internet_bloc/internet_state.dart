part of 'internet_bloc.dart';

@immutable
abstract class InternetState {}

class InternetInitial extends InternetState {}

class InternetOk extends InternetState {}

class NoInternet extends InternetState {}
