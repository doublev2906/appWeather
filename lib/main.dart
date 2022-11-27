import 'dart:async';

import 'package:app_weather/common/injector.dart' ;
import 'package:app_weather/common/navigator/navigation/navigation.dart';
import 'package:app_weather/common/navigator/router/app_router.dart';
import 'package:app_weather/presentation/home/bloc/home_cubit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:developer' as developer;
import 'common/navigator/router/router_module.dart';
import 'common/navigator/router/router_observer.dart';

Future<void> main() async {
  ///[cache some errors]
  FlutterError.onError = (FlutterErrorDetails details) async {
    if (!kReleaseMode) {
      FlutterError.dumpErrorToConsole(details);
    } else {
      Zone.current.handleUncaughtError(details.exception, details.stack!);
    }
  };

  ///[run app]
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await init();
    await Future.delayed(
      const Duration(seconds: 1),
    );
    disableErrorWidget();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark));
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp],)
        .then((_) {
      runApp(const MyApp());
    });

    ///[console] flavor running hidden when release mode
    if (!kReleaseMode) {}
  }, (error, stackTrace) {
    if(kDebugMode){
      developer.log('$error', name: '❎ ERROR OTHER   :');
      developer.log('$stackTrace', name: '❎ STACKTRACE    :');
    }
  });

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider.value(value: sl.get<HomeCubit>())
        ],
        child: MaterialApp(
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          navigatorObservers: [sl.get<AppRouteObserver>()],
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.light,
          builder: (context, child){
            return MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                child: child!);
          },
          navigatorKey: navigation.navigatorKey,
          initialRoute: AppRouter.splash,
          onGenerateRoute: (settings) => generateRoute(routes: AppRouter(), settings: settings),
        ));
  }

  Route<dynamic>? generateRoute({
    required RouterModule routes,
    required RouteSettings settings,
  }) {
    final routesMap = <String, MaterialPageRoute>{};
    routesMap.addAll(routes.getRoutes(settings));
    return routesMap[settings.name];
  }
}

/// [disable error] widget when [release mode]
void disableErrorWidget() {
  if (kReleaseMode) {
    ErrorWidget.builder = (details) {
      return const Center(
        child: Text('Something wrong, Please chek your debug console'),
      );
    };
  }
}
