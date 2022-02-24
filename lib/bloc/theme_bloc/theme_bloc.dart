import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:movie_review/data/repositories/theme_repo.dart';
import 'package:movie_review/utils/theme/theme.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeData currentTheme = appThemeData[AppTheme.primaryLight]!;
  ThemeRepo themeRepo = ThemeRepo();
  ThemeBloc()
      : super(ThemeInitial(themeData: appThemeData[AppTheme.primaryLight]!)) {
    // StreamSubscription _subscription;
    on<ThemeCheckEvent>((event, emit) async {
      await checkTheme(emit);
    });
    on<ThemeChangedEvent>((event, emit) => changeTheme(event, emit));
  }

  Future<void> checkTheme(Emitter<ThemeState> emit) async {
    try {
      bool currentTheme = await themeRepo.getTheme();
      if (currentTheme == true) {
        this.currentTheme = appThemeData[AppTheme.primaryLight]!;
        emit(ThemeChanged(themeData: appThemeData[AppTheme.primaryLight]!));
      } else {
        this.currentTheme = appThemeData[AppTheme.primaryDark]!;
        emit(ThemeChanged(themeData: appThemeData[AppTheme.primaryDark]!));
      }
    } catch (e) {
      // this.currentTheme = appThemeData[AppTheme.primaryLight]!;
      // emit(ThemeChanged(themeData: appThemeData[AppTheme.primaryLight]!));
    }
  }

  Future<void> changeTheme(
      ThemeChangedEvent event, Emitter<ThemeState> emit) async {
    try {
      if (event.themeData == appThemeData[AppTheme.primaryDark]!) {
        themeRepo.updateTheme(true);
      } else {
        themeRepo.updateTheme(false);
      }
      bool currentTheme = await themeRepo.getTheme();
      emit(ThemeChanged(themeData: event.themeData));
    } catch (e) {
      checkTheme(emit);
    }
  }

}
