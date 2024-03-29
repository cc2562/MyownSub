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

  /// `day`
  String get day {
    return Intl.message(
      'day',
      name: 'day',
      desc: '',
      args: [],
    );
  }

  /// `123`
  String get ss1 {
    return Intl.message(
      '123',
      name: 'ss1',
      desc: '',
      args: [],
    );
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: '',
      args: [],
    );
  }

  /// `Chart`
  String get chart {
    return Intl.message(
      'Chart',
      name: 'chart',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get Set {
    return Intl.message(
      'Settings',
      name: 'Set',
      desc: '',
      args: [],
    );
  }

  /// `per week`
  String get weekpay {
    return Intl.message(
      'per week',
      name: 'weekpay',
      desc: '',
      args: [],
    );
  }

  /// `per month`
  String get mobthpay {
    return Intl.message(
      'per month',
      name: 'mobthpay',
      desc: '',
      args: [],
    );
  }

  /// `each quarter`
  String get quarterly_payment {
    return Intl.message(
      'each quarter',
      name: 'quarterly_payment',
      desc: '',
      args: [],
    );
  }

  /// `every half year`
  String get semi_annual_payment {
    return Intl.message(
      'every half year',
      name: 'semi_annual_payment',
      desc: '',
      args: [],
    );
  }

  /// `per year`
  String get annual_fee {
    return Intl.message(
      'per year',
      name: 'annual_fee',
      desc: '',
      args: [],
    );
  }

  /// `permanent`
  String get permanent {
    return Intl.message(
      'permanent',
      name: 'permanent',
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
      Locale.fromSubtags(languageCode: 'zh'),
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
