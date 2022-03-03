part of 'home_bloc.dart';

@immutable
abstract class HomeEvent {}

class LoadHomeData extends HomeEvent {}

class LoadHomeDataOffline extends HomeEvent {}
 