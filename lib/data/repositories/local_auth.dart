import 'package:flutter/services.dart';
import 'package:local_auth/auth_strings.dart';
import 'package:local_auth/local_auth.dart';

class LocalAuth {
  static final _auth = LocalAuthentication();

  static AndroidAuthMessages androidStrings = const AndroidAuthMessages(
    cancelButton: 'cancel',
    goToSettingsButton: 'setting',
    biometricNotRecognized: 'Not Recognized',
    biometricSuccess: 'authentication success',
  );

  Future<bool> checkForBiometrics() async {
    try {
      bool canUseBiometrics = await _auth.canCheckBiometrics;
      return canUseBiometrics;
    } on PlatformException {
      return false;
    }
  }

  Future<bool> authenticate() async {
    final auth = await checkForBiometrics();
    if (!auth) {
      return false;
    }
    try {
      return await _auth.authenticate(
        sensitiveTransaction: true,
        localizedReason: "Place your finger",
        useErrorDialogs: true,
        androidAuthStrings: androidStrings,
        stickyAuth: true,
      );
    } on PlatformException {
      return false;
    }
  }
}
