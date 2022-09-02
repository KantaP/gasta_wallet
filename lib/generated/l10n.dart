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

  /// `Terms of services`
  String get termsOfServices {
    return Intl.message(
      'Terms of services',
      name: 'termsOfServices',
      desc: '',
      args: [],
    );
  }

  /// `Privacy policy`
  String get privacyPolicy {
    return Intl.message(
      'Privacy policy',
      name: 'privacyPolicy',
      desc: '',
      args: [],
    );
  }

  /// `====================================================================`
  String get setPinStart {
    return Intl.message(
      '====================================================================',
      name: 'setPinStart',
      desc: '',
      args: [],
    );
  }

  /// `Create Account`
  String get setPinTitle {
    return Intl.message(
      'Create Account',
      name: 'setPinTitle',
      desc: 'The title of setpin page',
      args: [],
    );
  }

  /// `Create a PIN`
  String get setPinHeadline {
    return Intl.message(
      'Create a PIN',
      name: 'setPinHeadline',
      desc: '',
      args: [],
    );
  }

  /// `Confirm a PIN`
  String get confirmPinHeadline {
    return Intl.message(
      'Confirm a PIN',
      name: 'confirmPinHeadline',
      desc: '',
      args: [],
    );
  }

  /// `To keep your funds secure, you will use this PIN to open your app`
  String get setPinContent {
    return Intl.message(
      'To keep your funds secure, you will use this PIN to open your app',
      name: 'setPinContent',
      desc: '',
      args: [],
    );
  }

  /// `For your security, Please confirm your PIN by typing again`
  String get confirmPinContent {
    return Intl.message(
      'For your security, Please confirm your PIN by typing again',
      name: 'confirmPinContent',
      desc: '',
      args: [],
    );
  }

  /// `====================================================================`
  String get setPinEnd {
    return Intl.message(
      '====================================================================',
      name: 'setPinEnd',
      desc: '',
      args: [],
    );
  }

  /// `====================================================================`
  String get gettingStartedStart {
    return Intl.message(
      '====================================================================',
      name: 'gettingStartedStart',
      desc: '',
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

  /// `Next`
  String get gettingStartedInfoNext {
    return Intl.message(
      'Next',
      name: 'gettingStartedInfoNext',
      desc: '',
      args: [],
    );
  }

  /// `Get Started`
  String get gettingStartedInfoSubmit {
    return Intl.message(
      'Get Started',
      name: 'gettingStartedInfoSubmit',
      desc: '',
      args: [],
    );
  }

  /// `====================================================================`
  String get gettingStartedEnd {
    return Intl.message(
      '====================================================================',
      name: 'gettingStartedEnd',
      desc: '',
      args: [],
    );
  }

  /// `====================================================================`
  String get createAccountStart {
    return Intl.message(
      '====================================================================',
      name: 'createAccountStart',
      desc: '',
      args: [],
    );
  }

  /// `Create account`
  String get createAccountTitle {
    return Intl.message(
      'Create account',
      name: 'createAccountTitle',
      desc: '',
      args: [],
    );
  }

  /// `Mobile number`
  String get createAccountMobileLabel {
    return Intl.message(
      'Mobile number',
      name: 'createAccountMobileLabel',
      desc: '',
      args: [],
    );
  }

  /// `I agree to GASTA Terms of services and Privacy policy`
  String get createAccountAgreeTerm {
    return Intl.message(
      'I agree to GASTA Terms of services and Privacy policy',
      name: 'createAccountAgreeTerm',
      desc: '',
      args: [],
    );
  }

  /// `Create account`
  String get createAccountSubmitButton {
    return Intl.message(
      'Create account',
      name: 'createAccountSubmitButton',
      desc: '',
      args: [],
    );
  }

  /// `====================================================================`
  String get createdAccountEnd {
    return Intl.message(
      '====================================================================',
      name: 'createdAccountEnd',
      desc: '',
      args: [],
    );
  }

  /// `====================================================================`
  String get otpVerificationStart {
    return Intl.message(
      '====================================================================',
      name: 'otpVerificationStart',
      desc: '',
      args: [],
    );
  }

  /// `Create account`
  String get otpVerificationTitle {
    return Intl.message(
      'Create account',
      name: 'otpVerificationTitle',
      desc: '',
      args: [],
    );
  }

  /// `Thanks for signing up with`
  String get otpVerificationHeadline {
    return Intl.message(
      'Thanks for signing up with',
      name: 'otpVerificationHeadline',
      desc: '',
      args: [],
    );
  }

  /// `Enter the SMS verification code you received`
  String get otpVerificationContent {
    return Intl.message(
      'Enter the SMS verification code you received',
      name: 'otpVerificationContent',
      desc: '',
      args: [],
    );
  }

  /// `Didn’t get the code?`
  String get otpVerificationDidNotGetCode {
    return Intl.message(
      'Didn’t get the code?',
      name: 'otpVerificationDidNotGetCode',
      desc: '',
      args: [],
    );
  }

  /// `Resend SMS`
  String get otpVerificationResendSMS {
    return Intl.message(
      'Resend SMS',
      name: 'otpVerificationResendSMS',
      desc: '',
      args: [],
    );
  }

  /// `====================================================================`
  String get otpVerificationEnd {
    return Intl.message(
      '====================================================================',
      name: 'otpVerificationEnd',
      desc: '',
      args: [],
    );
  }

  /// `====================================================================`
  String get signInStart {
    return Intl.message(
      '====================================================================',
      name: 'signInStart',
      desc: '',
      args: [],
    );
  }

  /// `Gasta`
  String get signInHeadline {
    return Intl.message(
      'Gasta',
      name: 'signInHeadline',
      desc: '',
      args: [],
    );
  }

  /// `Hello! Welcome to GASTA Start your investment today`
  String get signInContent {
    return Intl.message(
      'Hello! Welcome to GASTA Start your investment today',
      name: 'signInContent',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account?`
  String get signInAlreadyAccountContent {
    return Intl.message(
      'Already have an account?',
      name: 'signInAlreadyAccountContent',
      desc: '',
      args: [],
    );
  }

  /// `Sign in`
  String get signInAlreadyAccountAction {
    return Intl.message(
      'Sign in',
      name: 'signInAlreadyAccountAction',
      desc: '',
      args: [],
    );
  }

  /// `Create account`
  String get signInCreateAccountButton {
    return Intl.message(
      'Create account',
      name: 'signInCreateAccountButton',
      desc: '',
      args: [],
    );
  }

  /// `====================================================================`
  String get signInEnd {
    return Intl.message(
      '====================================================================',
      name: 'signInEnd',
      desc: '',
      args: [],
    );
  }

  /// `====================================================================`
  String get phoneAuthStart {
    return Intl.message(
      '====================================================================',
      name: 'phoneAuthStart',
      desc: '',
      args: [],
    );
  }

  /// `Sign in with phone number`
  String get phoneAuthTitle {
    return Intl.message(
      'Sign in with phone number',
      name: 'phoneAuthTitle',
      desc: '',
      args: [],
    );
  }

  /// `Mobile number`
  String get phoneAuthMobileLabel {
    return Intl.message(
      'Mobile number',
      name: 'phoneAuthMobileLabel',
      desc: '',
      args: [],
    );
  }

  /// `Sign in`
  String get phoneAuthSubmitButton {
    return Intl.message(
      'Sign in',
      name: 'phoneAuthSubmitButton',
      desc: '',
      args: [],
    );
  }

  /// `====================================================================`
  String get phoneAuthEnd {
    return Intl.message(
      '====================================================================',
      name: 'phoneAuthEnd',
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
