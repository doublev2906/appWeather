

import 'package:app_weather/model/city_model.dart';
import 'package:app_weather/presentation/city/city_page.dart';
import 'package:app_weather/presentation/home/home_page.dart';
import 'package:app_weather/presentation/main/main_page.dart';
import 'package:app_weather/presentation/setting/language_page.dart';
import 'package:app_weather/presentation/setting/setting_page.dart';
import 'package:app_weather/presentation/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'router_module.dart';

class AppRouter extends RouterModule {
  AppRouter();
  static const String splash = '/splash';
  static const String home = '/home';
  static const String city = '/city';
  static const String main = '/main';
  static const String setting = '/setting';
  static const String language = '/language';
  //MainPage

  @override
  Map<String, MaterialPageRoute> getRoutes(RouteSettings settings) {
    return {
      AppRouter.splash: MaterialPageRoute(
          builder: (context) => const SplashPage(), settings: settings),
      // AppRouter.home: MaterialPageRoute(
      //     builder: (context) => HomePage(city: settings.arguments as CityModel,), settings: settings),
      AppRouter.city: MaterialPageRoute(
          builder: (context) => const CityPage(), settings: settings),
      AppRouter.main: MaterialPageRoute(
          builder: (context) => const MainPage(), settings: settings),
      AppRouter.setting: MaterialPageRoute(
          builder: (context) => const SettingPage(), settings: settings),
      AppRouter.language: MaterialPageRoute(
          builder: (context) => const LanguagePage(), settings: settings),

    };
  }


}

abstract class Navigation {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(String routeName, {dynamic arguments});

  Future<dynamic> replaceTo(String routeName, {dynamic arguments});

  Future<dynamic> removeUntil(String routeName, {dynamic arguments});

  void popUntil(String routeName, {dynamic arguments});

  void goBack<T extends Object?>([T? result]);

  bool canPop();
}

class NavigationImpl extends Navigation {
  @override
  Future<dynamic> navigateTo(String routeName, {dynamic arguments}) {
    return navigatorKey.currentState!
        .pushNamed(routeName, arguments: arguments);
  }

  @override
  Future<dynamic> replaceTo(String routeName, {dynamic arguments}) {
    return navigatorKey.currentState!
        .pushReplacementNamed(routeName, arguments: arguments);
  }

  @override
  Future<dynamic> removeUntil(String routeName, {dynamic arguments}) {
    return navigatorKey.currentState!.pushNamedAndRemoveUntil(
        routeName, (Route<dynamic> route) => false,
        arguments: arguments);
  }

  @override
  void goBack<T extends Object?>([T? result]) {
    return navigatorKey.currentState!.pop<T>(result);
  }

  @override
  void popUntil(String routeName, {arguments}) {
    return navigatorKey.currentState!
        .popUntil((route) => route.settings.name == routeName);
  }

  @override
  bool canPop() {
    return navigatorKey.currentState!.canPop();
  }
}