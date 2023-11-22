import 'dart:async';

import 'package:app_weather/common/injector.dart';
import 'package:app_weather/common/navigator/navigation/navigation.dart';
import 'package:app_weather/common/navigator/router/app_router.dart';
import 'package:app_weather/generated/l10n.dart';
import 'package:app_weather/model/item.dart';
import 'package:app_weather/model/language_entity.dart';
import 'package:app_weather/presentation/city/bloc/city_c_bloc.dart';
import 'package:app_weather/presentation/city/city_page.dart';
import 'package:app_weather/presentation/home/bloc/home_cubit.dart';
import 'package:app_weather/presentation/main/bloc/main_page_bloc.dart';
import 'package:app_weather/util/box.dart';
import 'package:app_weather/util/settings.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:toast/toast.dart';
import 'dart:developer' as developer;
import 'common/navigator/router/router_module.dart';
import 'common/navigator/router/router_observer.dart';
import 'model/city_model.dart';

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
    await Hive.initFlutter();
    Hive.registerAdapter(CityModelAdapter());
    Hive.registerAdapter(ItemAdapter());
    Hive.registerAdapter(LanguageEntityAdapter());
    await Hive.openBox<CityModel>('citys');
    await Hive.openBox<Item>('topCities');
    await Hive.openBox<Item>('topCitiesWorld');
    await Hive.openBox<LanguageEntity?>('currentLanguage');
    initCities();
    initLanguage();
    await Future.delayed(
      const Duration(seconds: 1),
    );
    disableErrorWidget();
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarBrightness: Brightness.light,
        statusBarIconBrightness: Brightness.dark));
    SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp],
    ).then((_) {
      runApp(const MyApp());
    });

    ///[console] flavor running hidden when release mode
    if (!kReleaseMode) {}
  }, (error, stackTrace) {
    if (kDebugMode) {
      developer.log('$error', name: '❎ ERROR OTHER   :');
      developer.log('$stackTrace', name: '❎ STACKTRACE    :');
    }
  });

  runApp(const MyApp());
}

void initLanguage() {
  LanguageEntity? language;
  if (Boxes.getLanguage().isEmpty) {
    language = null;
  } else {
    language = Boxes.getLanguage().values.cast<LanguageEntity?>().first;
  }
  Setting.init(language);
}

void initCities() {
  final topCities = Boxes.getTopCities();
  if (topCities.isEmpty) {
    topCities.add(Item(
        data:
            CityModel(name: "Ha Noi", latitude: 21.0245, longitude: 105.841)));
    topCities.add(Item(
        data: CityModel(
            name: "Ho Chi Minh City", latitude: 10.8167, longitude: 106.633)));
    topCities.add(Item(
        data:
            CityModel(name: "Hai Phong", latitude: 20.8, longitude: 106.667)));
    topCities.add(Item(
        data:
            CityModel(name: "Da Nang", latitude: 16.0748, longitude: 108.224)));
    topCities.add(Item(
        data: CityModel(name: "Hue", latitude: 16.4667, longitude: 107.583)));
    topCities.add(Item(
        data: CityModel(name: "Ha Long", latitude: 20.95, longitude: 107.083)));
    topCities.add(Item(
        data:
            CityModel(name: "Da Lat", latitude: 11.9359, longitude: 108.443)));
    topCities.add(Item(
        data:
            CityModel(name: "Nha Trang", latitude: 12.25, longitude: 109.183)));
    topCities.add(Item(
        data:
            CityModel(name: "Hoi An", latitude: 15.8733, longitude: 108.333)));
    topCities.add(Item(
        data: CityModel(
            name: "Viet Tri", latitude: 21.3228, longitude: 105.402)));
    topCities.add(Item(
        data: CityModel(
            name: "Vung Tau", latitude: 10.4042, longitude: 107.142)));
    topCities.add(Item(
        data: CityModel(
            name: "Bac Ninh", latitude: 21.1861, longitude: 106.076)));
  }
  final topCitiesWorld = Boxes.getTopCitiesWorld();
  if (topCitiesWorld.isEmpty) {
    topCitiesWorld.add(Item(
        data: CityModel(
            name: "New York", latitude: 40.6943, longitude: -73.9249)));
    topCitiesWorld.add(Item(
        data: CityModel(name: "Paris", latitude: 48.8566, longitude: 2.3522)));
    topCitiesWorld.add(Item(
        data:
            CityModel(name: "London", latitude: 51.5072, longitude: -0.1275)));
    topCitiesWorld.add(Item(
        data: CityModel(name: "Tokyo", latitude: 35.6897, longitude: 139.692)));
    topCitiesWorld.add(Item(
        data: CityModel(name: "Rome", latitude: 41.8931, longitude: 12.4828)));
    topCitiesWorld.add(Item(
        data: CityModel(name: "Dubai", latitude: 25.2697, longitude: 55.3094)));
    topCitiesWorld.add(Item(
        data:
            CityModel(name: "Moscow", latitude: 55.7558, longitude: 37.6178)));
    topCitiesWorld.add(Item(
        data:
            CityModel(name: "Sydney", latitude: -33.865, longitude: 151.209)));
    topCitiesWorld.add(Item(
        data: CityModel(name: "Singapore", latitude: 1.3, longitude: 103.8)));
    topCitiesWorld.add(Item(
        data:
            CityModel(name: "Beijing", latitude: 39.905, longitude: 116.391)));
    topCitiesWorld.add(Item(
        data:
            CityModel(name: "Athens", latitude: 37.9794, longitude: 23.7161)));
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider.value(value: sl.get<HomeCubit>()),
          BlocProvider.value(value: CityCBloc()),
          BlocProvider.value(value: sl.get<MainPageBloc>()),
        ],
        child: MaterialApp(
          theme: ThemeData.light(),
          darkTheme: ThemeData.dark(),
          navigatorObservers: [sl.get<AppRouteObserver>()],
          debugShowCheckedModeBanner: false,
          locale: Locale(Setting.currentLanguage.code),
          localizationsDelegates: const [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate
          ],
          supportedLocales: S.delegate.supportedLocales,
          themeMode: ThemeMode.light,
          builder: (context, child) {
            return MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                child: child!);
          },
          navigatorKey: navigation.navigatorKey,
          initialRoute: AppRouter.splash,
          onGenerateRoute: (settings) =>
              generateRoute(routes: AppRouter(), settings: settings),
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
