import 'package:flutter/material.dart';
import 'package:naughtech/landing_dependencies/bloc/appbar_opacity.dart';

abstract class LandingMethod {
  final AppBarOpacity opacity = AppBarOpacity.instance;
  scrollListener(ScrollController controller) {
    double ff = controller.position.pixels / 900;
    opacity.update(ff < 1.0 ? ff : 1.0);
  }
}
