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

  /// `Forecast Page`
  String get page_title_forecast {
    return Intl.message(
      'Forecast Page',
      name: 'page_title_forecast',
      desc: '',
      args: [],
    );
  }

  /// `Location Search`
  String get page_title_location_search {
    return Intl.message(
      'Location Search',
      name: 'page_title_location_search',
      desc: '',
      args: [],
    );
  }

  /// `Favorite Location`
  String get page_title_favorite_location {
    return Intl.message(
      'Favorite Location',
      name: 'page_title_favorite_location',
      desc: '',
      args: [],
    );
  }

  /// `No view for state:`
  String get error_message_no_view_state {
    return Intl.message(
      'No view for state:',
      name: 'error_message_no_view_state',
      desc: '',
      args: [],
    );
  }

  /// `mph`
  String get suffix_wind_speed {
    return Intl.message(
      'mph',
      name: 'suffix_wind_speed',
      desc: '',
      args: [],
    );
  }

  /// `mb`
  String get suffix_pressure {
    return Intl.message(
      'mb',
      name: 'suffix_pressure',
      desc: '',
      args: [],
    );
  }

  /// `miles`
  String get suffix_path_visibility {
    return Intl.message(
      'miles',
      name: 'suffix_path_visibility',
      desc: '',
      args: [],
    );
  }

  /// `%`
  String get suffix_path_humidity {
    return Intl.message(
      '%',
      name: 'suffix_path_humidity',
      desc: '',
      args: [],
    );
  }

  /// `Max:`
  String get temperature_max {
    return Intl.message(
      'Max:',
      name: 'temperature_max',
      desc: '',
      args: [],
    );
  }

  /// `Min:`
  String get temperature_min {
    return Intl.message(
      'Min:',
      name: 'temperature_min',
      desc: '',
      args: [],
    );
  }

  /// `Input location name`
  String get hint_text_input_location_search {
    return Intl.message(
      'Input location name',
      name: 'hint_text_input_location_search',
      desc: '',
      args: [],
    );
  }

  /// `Empty result found`
  String get message_information_page {
    return Intl.message(
      'Empty result found',
      name: 'message_information_page',
      desc: '',
      args: [],
    );
  }

  /// `Favorite location not found`
  String get no_favorite_message_information_page {
    return Intl.message(
      'Favorite location not found',
      name: 'no_favorite_message_information_page',
      desc: '',
      args: [],
    );
  }

  /// `Error loading weather data`
  String get error_loading_weather_data {
    return Intl.message(
      'Error loading weather data',
      name: 'error_loading_weather_data',
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
