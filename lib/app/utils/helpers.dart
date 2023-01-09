import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Helpers {
  static getLoadingWidget() {
    return const SpinKitChasingDots(
      color: Colors.white,
    );
  }
}
