part of 'theme_bloc.dart';

@immutable
abstract class ThemeEvent {}

class ThemeCheckEvent extends ThemeEvent {}

class ThemeChangedEvent extends ThemeEvent {
  final ThemeData themeData;
  ThemeChangedEvent({required this.themeData});
}
