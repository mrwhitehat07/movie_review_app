import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

part 'internet_event.dart';
part 'internet_state.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  InternetBloc() : super(InternetInitial()) {
    on<InternetEvent>((event, emit) {});
    on<CheckInternet>((event, emit) => checkInternet(event, emit));
  }

  Future<void> checkInternet(
      CheckInternet event, Emitter<InternetState> emit) async {
    var result = await Connectivity().checkConnectivity();

    if (result == ConnectivityResult.mobile ||
        result == ConnectivityResult.wifi) {
      emit(InternetOk());
    } else {
      emit(NoInternet());
    }
  }
}
