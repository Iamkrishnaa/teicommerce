import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Helpers {
  static getLoadingWidget({Color color = Colors.white}) {
    return SpinKitChasingDots(
      color: color,
    );
  }
}
