// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i13;

import '../../data/local/shared_preferences.dart' as _i14;
import '../../data/network/dio_client.dart' as _i4;
import '../../data/network/firebase_client.dart' as _i10;
import '../../features/authenticate/data/local/di/user.ds.dart' as _i22;
import '../../features/authenticate/data/repositories/authentication.repo.dart'
    as _i24;
import '../../features/authenticate/data/repositories/di/authentication.repo.dev.dart'
    as _i27;
import '../../features/authenticate/data/repositories/di/authentication.repo.prod.dart'
    as _i26;
import '../../features/authenticate/data/repositories/di/authentication.repo.stag.dart'
    as _i25;
import '../../features/authenticate/service/di/authentication.firebase.dart'
    as _i23;
import '../../features/authenticate/view/di/create_account.vm.dart' as _i28;
import '../../features/authenticate/view/di/otp_verification.vm.dart' as _i32;
import '../../features/authenticate/view/di/phone_auth.vm.dart' as _i12;
import '../../features/authenticate/view/di/set_pin.vm.dart' as _i34;
import '../../features/authenticate/view/di/sign_in.vm.dart' as _i36;
import '../../features/dashboard/view/di/overview.vm.dart' as _i33;
import '../../features/event/data/repositories/di/event.repo.dev.dart' as _i6;
import '../../features/event/data/repositories/di/event.repo.prod.dart' as _i7;
import '../../features/event/data/repositories/di/event.repo.stag.dart' as _i8;
import '../../features/event/data/repositories/event.repo.dart' as _i5;
import '../../features/event/service/di/event.s.dart' as _i9;
import '../../features/event/view/di/create_event.vm.dart' as _i29;
import '../../features/event/view/di/event_list.vm.dart' as _i30;
import '../../features/introduction/service/di/splash_screen.firebase.dart'
    as _i20;
import '../../features/introduction/view/di/getting_started.vm.dart' as _i31;
import '../../features/introduction/view/di/splash_screen.vm.dart' as _i21;
import '../../features/main/view/di/main.vm.dart' as _i11;
import '../../features/shopping_cart/data/repositories/di/shopping_cart.repo.dev.dart'
    as _i18;
import '../../features/shopping_cart/data/repositories/di/shopping_cart.repo.prod.dart'
    as _i16;
import '../../features/shopping_cart/data/repositories/di/shopping_cart.repo.stag.dart'
    as _i17;
import '../../features/shopping_cart/data/repositories/shopping_cart.repo.dart'
    as _i15;
import '../../features/shopping_cart/service/di/shopping_cart.s.dart' as _i19;
import '../../features/shopping_cart/view/di/shopping_cart.vm.dart' as _i35;
import '../modules/local_module.dart' as _i38;
import '../modules/network_module.dart' as _i37;

const String _development = 'development';
const String _production = 'production';
const String _stagging = 'stagging';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final networkModule = _$NetworkModule();
  final localModule = _$LocalModule();
  gh.factory<_i3.Dio>(() => networkModule.provideDio());
  gh.singleton<_i4.DioClient>(_i4.DioClient(get<_i3.Dio>()));
  gh.factory<_i5.EventRepository>(() => _i6.EventRepositoryDev(),
      registerFor: {_development});
  gh.factory<_i5.EventRepository>(() => _i7.EventRepositoryProd(),
      registerFor: {_production});
  gh.factory<_i5.EventRepository>(() => _i8.EventRepositoryStag(),
      registerFor: {_stagging});
  gh.singleton<_i9.EventService>(_i9.EventService(get<_i5.EventRepository>()));
  gh.singleton<_i10.FirebaseClient>(_i10.FirebaseClient());
  gh.factory<_i11.MainViewModel>(() => _i11.MainViewModel());
  gh.factory<_i12.PhoneAuthViewModel>(() => _i12.PhoneAuthViewModel());
  await gh.factoryAsync<_i13.SharedPreferences>(
      () => localModule.provideSharedPreferences(),
      preResolve: true);
  gh.factory<_i14.SharedPreferencesHelper>(
      () => _i14.SharedPreferencesHelper(get<_i13.SharedPreferences>()));
  gh.factory<_i15.ShoppingCartRepository>(
      () => _i16.ShoppingCartRepositoryProd(),
      registerFor: {_production});
  gh.factory<_i15.ShoppingCartRepository>(
      () => _i17.ShoppingCartRepositoryStag(),
      registerFor: {_stagging});
  gh.factory<_i15.ShoppingCartRepository>(
      () => _i18.ShoppingCartRepositoryDev(),
      registerFor: {_development});
  gh.factory<_i19.ShoppingCartService>(
      () => _i19.ShoppingCartService(get<_i15.ShoppingCartRepository>()));
  gh.singleton<_i20.SplashScreenFirebaseService>(
      _i20.SplashScreenFirebaseService(get<_i10.FirebaseClient>()));
  gh.factory<_i21.SplashScreenViewModel>(() => _i21.SplashScreenViewModel(
      get<_i20.SplashScreenFirebaseService>(),
      get<_i14.SharedPreferencesHelper>()));
  gh.singleton<_i22.UserDataSource>(_i22.UserDataSource());
  gh.singleton<_i23.AuthenticationFirebaseService>(
      _i23.AuthenticationFirebaseService(
          get<_i10.FirebaseClient>(), get<_i22.UserDataSource>()));
  gh.factory<_i24.AuthenticationRepository>(
      () => _i25.AuthenticationRepositoryStag(get<_i22.UserDataSource>()),
      registerFor: {_stagging});
  gh.factory<_i24.AuthenticationRepository>(
      () => _i26.AuthenticationRepositoryProd(get<_i22.UserDataSource>()),
      registerFor: {_production});
  gh.factory<_i24.AuthenticationRepository>(
      () => _i27.AuthenticationRepositoryDev(get<_i22.UserDataSource>()),
      registerFor: {_development});
  gh.factory<_i28.CreateAccountViewModel>(() => _i28.CreateAccountViewModel(
      get<_i24.AuthenticationRepository>(),
      get<_i23.AuthenticationFirebaseService>(),
      get<_i14.SharedPreferencesHelper>()));
  gh.factory<_i29.CreateEventViewModel>(
      () => _i29.CreateEventViewModel(get<_i9.EventService>()));
  gh.factory<_i30.EventListViewModel>(
      () => _i30.EventListViewModel(get<_i9.EventService>()));
  gh.factory<_i31.GettingStartedViewModel>(
      () => _i31.GettingStartedViewModel(get<_i14.SharedPreferencesHelper>()));
  gh.factory<_i32.OtpVerificationViewModel>(() =>
      _i32.OtpVerificationViewModel(get<_i23.AuthenticationFirebaseService>()));
  gh.factory<_i33.OverViewViewModel>(() => _i33.OverViewViewModel(
      get<_i23.AuthenticationFirebaseService>(),
      get<_i14.SharedPreferencesHelper>()));
  gh.factory<_i34.SetPinViewModel>(() => _i34.SetPinViewModel(
      get<_i23.AuthenticationFirebaseService>(),
      get<_i14.SharedPreferencesHelper>()));
  gh.factory<_i35.ShoppingCartPageViewModel>(
      () => _i35.ShoppingCartPageViewModel(get<_i19.ShoppingCartService>()));
  gh.factory<_i36.SignInPageViewModel>(() => _i36.SignInPageViewModel(
      get<_i24.AuthenticationRepository>(),
      get<_i23.AuthenticationFirebaseService>(),
      get<_i14.SharedPreferencesHelper>()));
  return get;
}

class _$NetworkModule extends _i37.NetworkModule {}

class _$LocalModule extends _i38.LocalModule {}
