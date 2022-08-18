// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../data/network/dio_client.dart' as _i4;
import '../../data/network/firebase_client.dart' as _i10;
import '../../features/authenticate/data/local/di/user.ds.dart' as _i21;
import '../../features/authenticate/data/repositories/authentication.repo.dart'
    as _i23;
import '../../features/authenticate/data/repositories/di/authentication.repo.dev.dart'
    as _i26;
import '../../features/authenticate/data/repositories/di/authentication.repo.prod.dart'
    as _i25;
import '../../features/authenticate/data/repositories/di/authentication.repo.stag.dart'
    as _i24;
import '../../features/authenticate/service/di/authentication.firebase.dart'
    as _i22;
import '../../features/authenticate/view/di/create_account.vm.dart' as _i27;
import '../../features/authenticate/view/di/set_pin.vm.dart' as _i13;
import '../../features/authenticate/view/di/sign_in.vm.dart' as _i31;
import '../../features/dashboard/view/di/overview.vm.dart' as _i12;
import '../../features/event/data/repositories/di/event.repo.dev.dart' as _i6;
import '../../features/event/data/repositories/di/event.repo.prod.dart' as _i7;
import '../../features/event/data/repositories/di/event.repo.stag.dart' as _i8;
import '../../features/event/data/repositories/event.repo.dart' as _i5;
import '../../features/event/service/di/event.s.dart' as _i9;
import '../../features/event/view/di/create_event.vm.dart' as _i28;
import '../../features/event/view/di/event_list.vm.dart' as _i29;
import '../../features/introduction/service/di/splash_screen.firebase.dart'
    as _i19;
import '../../features/introduction/view/di/splash_screen.vm.dart' as _i20;
import '../../features/main/view/di/main.vm.dart' as _i11;
import '../../features/shopping_cart/data/repositories/di/shopping_cart.repo.dev.dart'
    as _i17;
import '../../features/shopping_cart/data/repositories/di/shopping_cart.repo.prod.dart'
    as _i15;
import '../../features/shopping_cart/data/repositories/di/shopping_cart.repo.stag.dart'
    as _i16;
import '../../features/shopping_cart/data/repositories/shopping_cart.repo.dart'
    as _i14;
import '../../features/shopping_cart/service/di/shopping_cart.s.dart' as _i18;
import '../../features/shopping_cart/view/di/shopping_cart.vm.dart' as _i30;
import '../modules/network_module.dart' as _i32;

const String _development = 'development';
const String _production = 'production';
const String _stagging = 'stagging';
// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final networkModule = _$NetworkModule();
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
  gh.factory<_i12.OverViewViewModel>(() => _i12.OverViewViewModel());
  gh.factory<_i13.SetPinViewModel>(() => _i13.SetPinViewModel());
  gh.factory<_i14.ShoppingCartRepository>(
      () => _i15.ShoppingCartRepositoryProd(),
      registerFor: {_production});
  gh.factory<_i14.ShoppingCartRepository>(
      () => _i16.ShoppingCartRepositoryStag(),
      registerFor: {_stagging});
  gh.factory<_i14.ShoppingCartRepository>(
      () => _i17.ShoppingCartRepositoryDev(),
      registerFor: {_development});
  gh.factory<_i18.ShoppingCartService>(
      () => _i18.ShoppingCartService(get<_i14.ShoppingCartRepository>()));
  gh.singleton<_i19.SplashScreenFirebaseService>(
      _i19.SplashScreenFirebaseService(get<_i10.FirebaseClient>()));
  gh.factory<_i20.SplashScreenViewModel>(() =>
      _i20.SplashScreenViewModel(get<_i19.SplashScreenFirebaseService>()));
  gh.singleton<_i21.UserDataSource>(_i21.UserDataSource());
  gh.singleton<_i22.AuthenticationFirebaseService>(
      _i22.AuthenticationFirebaseService(get<_i10.FirebaseClient>()));
  gh.factory<_i23.AuthenticationRepository>(
      () => _i24.AuthenticationRepositoryStag(get<_i21.UserDataSource>()),
      registerFor: {_stagging});
  gh.factory<_i23.AuthenticationRepository>(
      () => _i25.AuthenticationRepositoryProd(get<_i21.UserDataSource>()),
      registerFor: {_production});
  gh.factory<_i23.AuthenticationRepository>(
      () => _i26.AuthenticationRepositoryDev(get<_i21.UserDataSource>()),
      registerFor: {_development});
  gh.factory<_i27.CreateAccountViewModel>(() => _i27.CreateAccountViewModel(
      get<_i23.AuthenticationRepository>(),
      get<_i22.AuthenticationFirebaseService>()));
  gh.factory<_i28.CreateEventViewModel>(
      () => _i28.CreateEventViewModel(get<_i9.EventService>()));
  gh.factory<_i29.EventListViewModel>(
      () => _i29.EventListViewModel(get<_i9.EventService>()));
  gh.factory<_i30.ShoppingCartPageViewModel>(
      () => _i30.ShoppingCartPageViewModel(get<_i18.ShoppingCartService>()));
  gh.factory<_i31.SignInPageViewModel>(() => _i31.SignInPageViewModel(
      get<_i23.AuthenticationRepository>(),
      get<_i22.AuthenticationFirebaseService>()));
  return get;
}

class _$NetworkModule extends _i32.NetworkModule {}
