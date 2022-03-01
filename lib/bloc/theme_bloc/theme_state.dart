part of 'theme_bloc.dart';

@immutable
abstract class ThemeState {}

class ThemeInitial extends ThemeState {
  final ThemeData themeData;
  ThemeInitial({required this.themeData});
  @override
  List<Object?> get props => [themeData];
}

class ThemeChanged extends ThemeState {
  final ThemeData themeData;
  ThemeChanged({required this.themeData});
  @override
  List<Object?> get props => [themeData];
}

class InternetOk extends ThemeState {}

class NoInternet extends ThemeState {}
