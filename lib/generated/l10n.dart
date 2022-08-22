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

  /// `Hello World!`
  String get helloWorld {
    return Intl.message(
      'Hello World!',
      name: 'helloWorld',
      desc: 'The conventional newborn programmer greeting',
      args: [],
    );
  }

  /// `Set Pin`
  String get setPinTitle {
    return Intl.message(
      'Set Pin',
      name: 'setPinTitle',
      desc: 'The title of setpin page',
      args: [],
    );
  }

  /// `Take hold of your finances`
  String get gettingStartedInfoOneTitle {
    return Intl.message(
      'Take hold of your finances',
      name: 'gettingStartedInfoOneTitle',
      desc: 'The title of 1st info getting started',
      args: [],
    );
  }

  /// `Lorem ipsum dolor sit amet consectetur adipiscing elit Ut et massa mi. Aliquam in hendrerit urna. Pellentesque sit amet sapien.`
  String get gettingStartedInfoOneContent {
    return Intl.message(
      'Lorem ipsum dolor sit amet consectetur adipiscing elit Ut et massa mi. Aliquam in hendrerit urna. Pellentesque sit amet sapien.',
      name: 'gettingStartedInfoOneContent',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get gettingStartedInfoOneButton {
    return Intl.message(
      'Next',
      name: 'gettingStartedInfoOneButton',
      desc: '',
      args: [],
    );
  }

  /// `Buy and Sell Crypto`
  String get gettingStartedInfoTwoTitle {
    return Intl.message(
      'Buy and Sell Crypto',
      name: 'gettingStartedInfoTwoTitle',
      desc: 'The title of 2nd info getting started',
      args: [],
    );
  }

  /// `Lorem ipsum dolor sit amet consectetur adipiscing elit Ut et massa mi. Aliquam in hendrerit urna. Pellentesque sit amet sapien.`
  String get gettingStartedInfoTwoContent {
    return Intl.message(
      'Lorem ipsum dolor sit amet consectetur adipiscing elit Ut et massa mi. Aliquam in hendrerit urna. Pellentesque sit amet sapien.',
      name: 'gettingStartedInfoTwoContent',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get gettingStartedInfoTwoButton {
    return Intl.message(
      'Next',
      name: 'gettingStartedInfoTwoButton',
      desc: '',
      args: [],
    );
  }

  /// `Smart trading tools`
  String get gettingStartedInfoThreeTitle {
    return Intl.message(
      'Smart trading tools',
      name: 'gettingStartedInfoThreeTitle',
      desc: 'The title of 3nd info getting started',
      args: [],
    );
  }

  /// `Lorem ipsum dolor sit amet consectetur adipiscing elit Ut et massa mi. Aliquam in hendrerit urna. Pellentesque sit amet sapien.`
  String get gettingStartedInfoThreeContent {
    return Intl.message(
      'Lorem ipsum dolor sit amet consectetur adipiscing elit Ut et massa mi. Aliquam in hendrerit urna. Pellentesque sit amet sapien.',
      name: 'gettingStartedInfoThreeContent',
      desc: '',
      args: [],
    );
  }

  /// `Get Started`
  String get gettingStartedInfoThreeButton {
    return Intl.message(
      'Get Started',
      name: 'gettingStartedInfoThreeButton',
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
      Locale.fromSubtags(languageCode: 'th'),
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
