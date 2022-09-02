import 'package:flutter/material.dart';
import 'package:gastawallet/src/constants/routes.dart';
import 'package:gastawallet/src/di/components/injection.dart';
import 'package:gastawallet/src/features/authenticate/view/create_account.p.dart';
import 'package:gastawallet/src/features/authenticate/view/di/create_account.vm.dart';
import 'package:gastawallet/src/features/authenticate/view/di/otp_verification.vm.dart';
import 'package:gastawallet/src/features/authenticate/view/di/phone_auth.vm.dart';
import 'package:gastawallet/src/features/authenticate/view/di/set_pin.vm.dart';
import 'package:gastawallet/src/features/authenticate/view/otp_verification.p.dart';
import 'package:gastawallet/src/features/authenticate/view/phone_auth.p.dart';
import 'package:gastawallet/src/features/authenticate/view/set_pin.p.dart';
import 'package:gastawallet/src/features/authenticate/view/sign_in.p.dart';
import 'package:gastawallet/src/features/event/view/create_event.p.dart';
import 'package:gastawallet/src/features/event/view/di/create_event.vm.dart';
import 'package:gastawallet/src/features/introduction/view/di/getting_started.vm.dart';
import 'package:gastawallet/src/features/introduction/view/di/splash_screen.vm.dart';
import 'package:gastawallet/src/features/introduction/view/getting_started.p.dart';
import 'package:gastawallet/src/features/introduction/view/splash_screen.p.dart';
import 'package:gastawallet/src/features/main/view/di/main.vm.dart';
import 'package:gastawallet/src/features/main/view/main.p.dart';
import 'features/authenticate/view/di/sign_in.vm.dart';

class AppRouter {
  Route<dynamic>? route(RouteSettings settings) {
    final arguments = settings.arguments as Map<String, dynamic>? ?? {};
    switch (settings.name) {
      case RoutesConstant.splashScreen:
        return MaterialPageRoute(
          // Make sure to pass `setting` in to ensure the route name is kept 
          settings: settings,
          builder: (_) => SplashScreenPage(viewModel: getIt<SplashScreenViewModel>()),
        );
      case RoutesConstant.home:
        return MaterialPageRoute(
          // Make sure to pass `setting` in to ensure the route name is kept 
          settings: settings,
          builder: (_) => MainPage(viewModel: getIt<MainViewModel>()),
        );
      case RoutesConstant.createAccount:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => CreateAccountPage(viewModel: getIt<CreateAccountViewModel>()),
        );
      case RoutesConstant.userSignIn:
        return MaterialPageRoute(
          // Make sure to pass `setting` in to ensure the route name is kept 
          settings: settings,
          builder: (_) => SignInPage(viewModel: getIt<SignInPageViewModel>()),
        );
      case RoutesConstant.createEvent:
        return MaterialPageRoute(
          // Make sure to pass `setting` in to ensure the route name is kept 
          settings: settings,
          builder: (_) => CreateEventPage(viewModel: getIt<CreateEventViewModel>()),
        );
      case RoutesConstant.setPin:
        return  MaterialPageRoute(
          // Make sure to pass `setting` in to ensure the route name is kept 
          settings: settings,
          builder: (_) => SetPinPage(viewModel: getIt<SetPinViewModel>()),
        );
      case RoutesConstant.gettingStarted:
        return MaterialPageRoute(
          // Make sure to pass `setting` in to ensure the route name is kept 
          settings: settings,
          builder: (_) => GettingStartedPage(viewModel: getIt<GettingStartedViewModel>()),
        );
      case RoutesConstant.otpVerification:
        return MaterialPageRoute(
          // Make sure to pass `setting` in to ensure the route name is kept 
          settings: settings,
          builder: (_) => OtpVerificationPage(viewModel: getIt<OtpVerificationViewModel>()),
        );
      case RoutesConstant.phoneAuth: 
        return MaterialPageRoute(
          // Make sure to pass `setting` in to ensure the route name is kept 
          settings: settings,
          builder: (_) => PhoneAuthPage(viewModel: getIt<PhoneAuthViewModel>()),
        ); 
      default:
        throw Exception('Route ${settings.name} not implemented');
    }
  }
}
