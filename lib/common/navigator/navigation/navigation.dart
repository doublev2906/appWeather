import 'package:flutter/material.dart';

import '../../injector.dart';





Navigation navigation = sl.get<Navigation>();

abstract class Navigation {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(String routeName, {dynamic arguments});

  Future<dynamic> replaceTo(String routeName, {dynamic arguments});

  Future<dynamic> removeUntil(String routeName, {dynamic arguments});

  void popUntil(String routeName, {dynamic arguments});

  void goBack<T extends Object?>([T? result]);
}

