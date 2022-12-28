// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `15 days weather forecast`
  String get forecast {
    return Intl.message(
      '15 days weather forecast',
      name: 'forecast',
      desc: '',
      args: [],
    );
  }

  /// `Humidity`
  String get humidity {
    return Intl.message(
      'Humidity',
      name: 'humidity',
      desc: '',
      args: [],
    );
  }

  /// `UV`
  String get uv {
    return Intl.message(
      'UV',
      name: 'uv',
      desc: '',
      args: [],
    );
  }

  /// `Feel like`
  String get feel_like {
    return Intl.message(
      'Feel like',
      name: 'feel_like',
      desc: '',
      args: [],
    );
  }

  /// `SSW wind`
  String get ssw_wind {
    return Intl.message(
      'SSW wind',
      name: 'ssw_wind',
      desc: '',
      args: [],
    );
  }

  /// `Visibility`
  String get visibility {
    return Intl.message(
      'Visibility',
      name: 'visibility',
      desc: '',
      args: [],
    );
  }

  /// `Air pressure`
  String get air_pressure {
    return Intl.message(
      'Air pressure',
      name: 'air_pressure',
      desc: '',
      args: [],
    );
  }

  /// `Change of rain`
  String get change_of_rain {
    return Intl.message(
      'Change of rain',
      name: 'change_of_rain',
      desc: '',
      args: [],
    );
  }

  /// `Sunrise`
  String get sunrise {
    return Intl.message(
      'Sunrise',
      name: 'sunrise',
      desc: '',
      args: [],
    );
  }

  /// `Sunset`
  String get sunset {
    return Intl.message(
      'Sunset',
      name: 'sunset',
      desc: '',
      args: [],
    );
  }

  /// `Manage cities`
  String get manage_city {
    return Intl.message(
      'Manage cities',
      name: 'manage_city',
      desc: '',
      args: [],
    );
  }

  /// `Selected`
  String get selected {
    return Intl.message(
      'Selected',
      name: 'selected',
      desc: '',
      args: [],
    );
  }

  /// `Delete`
  String get delete {
    return Intl.message(
      'Delete',
      name: 'delete',
      desc: '',
      args: [],
    );
  }

  /// `TOP CITIES`
  String get top_cites {
    return Intl.message(
      'TOP CITIES',
      name: 'top_cites',
      desc: '',
      args: [],
    );
  }

  /// `TOP CITIES WORLD`
  String get top_cites_world {
    return Intl.message(
      'TOP CITIES WORLD',
      name: 'top_cites_world',
      desc: '',
      args: [],
    );
  }

  /// `Search for city`
  String get search_city_hint {
    return Intl.message(
      'Search for city',
      name: 'search_city_hint',
      desc: '',
      args: [],
    );
  }

  /// `Tap search to start searching.`
  String get search_city_label {
    return Intl.message(
      'Tap search to start searching.',
      name: 'search_city_label',
      desc: '',
      args: [],
    );
  }

  /// `Add City`
  String get add_city {
    return Intl.message(
      'Add City',
      name: 'add_city',
      desc: '',
      args: [],
    );
  }

  /// `English`
  String get english {
    return Intl.message(
      'English',
      name: 'english',
      desc: '',
      args: [],
    );
  }

  /// `Vietnamese`
  String get vietnamese {
    return Intl.message(
      'Vietnamese',
      name: 'vietnamese',
      desc: '',
      args: [],
    );
  }

  /// `Setting`
  String get setting {
    return Intl.message(
      'Setting',
      name: 'setting',
      desc: '',
      args: [],
    );
  }

  /// `Language`
  String get language {
    return Intl.message(
      'Language',
      name: 'language',
      desc: '',
      args: [],
    );
  }

  /// `Today`
  String get today {
    return Intl.message(
      'Today',
      name: 'today',
      desc: '',
      args: [],
    );
  }

  /// `Tomorrow`
  String get tomorrow {
    return Intl.message(
      'Tomorrow',
      name: 'tomorrow',
      desc: '',
      args: [],
    );
  }

  /// `MMM d EE`
  String get dateFormat {
    return Intl.message(
      'MMM d EE',
      name: 'dateFormat',
      desc: '',
      args: [],
    );
  }

  /// `EEE`
  String get dateFormatItem {
    return Intl.message(
      'EEE',
      name: 'dateFormatItem',
      desc: '',
      args: [],
    );
  }

  /// `Settings will be applied after restart`
  String get settingChange {
    return Intl.message(
      'Settings will be applied after restart',
      name: 'settingChange',
      desc: '',
      args: [],
    );
  }

  /// `Level of air quality by United States Environmental Protection Agency (US - EPA)`
  String get airBottomsheetTitle {
    return Intl.message(
      'Level of air quality by United States Environmental Protection Agency (US - EPA)',
      name: 'airBottomsheetTitle',
      desc: '',
      args: [],
    );
  }

  /// `Good`
  String get level1 {
    return Intl.message(
      'Good',
      name: 'level1',
      desc: '',
      args: [],
    );
  }

  /// `Moderate`
  String get level2 {
    return Intl.message(
      'Moderate',
      name: 'level2',
      desc: '',
      args: [],
    );
  }

  /// `Unhealthy`
  String get level3 {
    return Intl.message(
      'Unhealthy',
      name: 'level3',
      desc: '',
      args: [],
    );
  }

  /// `Unhealthy`
  String get level4 {
    return Intl.message(
      'Unhealthy',
      name: 'level4',
      desc: '',
      args: [],
    );
  }

  /// `Very Unhealthy`
  String get level5 {
    return Intl.message(
      'Very Unhealthy',
      name: 'level5',
      desc: '',
      args: [],
    );
  }

  /// `Hazardous`
  String get level6 {
    return Intl.message(
      'Hazardous',
      name: 'level6',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'vi'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
