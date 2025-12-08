// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:connectivity_plus/connectivity_plus.dart' as _i895;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

import '../../features/auth/data/datasources/auth_mock_datasource.dart'
    as _i306;
import '../../features/auth/data/datasources/auth_remote_datasource.dart'
    as _i161;
import '../../features/auth/data/repositories/auth_repository_impl.dart'
    as _i153;
import '../../features/auth/domain/repositories/auth_repository.dart' as _i787;
import '../../features/auth/domain/usecases/login_usecase.dart' as _i188;
import '../../features/auth/domain/usecases/logout_usecase.dart' as _i48;
import '../../features/auth/domain/usecases/signup_usecase.dart' as _i57;
import '../../features/auth/presentation/blocs/auth_bloc.dart' as _i85;
import '../../features/cart/data/datasources/cart_local_datasource.dart'
    as _i339;
import '../../features/cart/data/repositories/cart_repository_impl.dart'
    as _i642;
import '../../features/cart/domain/repositories/cart_repository.dart' as _i322;
import '../../features/cart/domain/usecases/add_to_cart_usecase.dart' as _i659;
import '../../features/cart/domain/usecases/get_cart_items_usecase.dart'
    as _i342;
import '../../features/cart/domain/usecases/remove_from_cart_usecase.dart'
    as _i355;
import '../../features/cart/domain/usecases/update_cart_item_usecase.dart'
    as _i495;
import '../../features/cart/presentation/blocs/cart_bloc.dart' as _i98;
import '../../features/checkout/data/datasources/checkout_local_datasource.dart'
    as _i25;
import '../../features/checkout/data/datasources/checkout_remote_datasource.dart'
    as _i26;
import '../../features/checkout/data/repositories/checkout_repository_impl.dart'
    as _i949;
import '../../features/checkout/domain/repositories/checkout_repository.dart'
    as _i498;
import '../../features/checkout/domain/usecases/create_order_summary_usecase.dart'
    as _i238;
import '../../features/checkout/domain/usecases/process_payment_usecase.dart'
    as _i117;
import '../../features/checkout/presentation/blocs/checkout_bloc.dart' as _i881;
import '../../features/product/data/datasources/product_remote_datasource.dart'
    as _i963;
import '../../features/product/data/repositories/product_repository_impl.dart'
    as _i1040;
import '../../features/product/domain/repositories/product_repository.dart'
    as _i39;
import '../../features/product/domain/usecases/get_product_details_usecase.dart'
    as _i133;
import '../../features/product/presentation/blocs/product_bloc.dart' as _i1008;
import '../../features/profile/data/datasources/profile_local_datasource.dart'
    as _i1046;
import '../../features/profile/data/datasources/profile_remote_datasource.dart'
    as _i327;
import '../../features/profile/data/repositories/profile_repository_impl.dart'
    as _i334;
import '../../features/profile/domain/repositories/profile_repository.dart'
    as _i894;
import '../../features/profile/domain/usecases/get_order_history_usecase.dart'
    as _i303;
import '../../features/profile/domain/usecases/get_user_profile_usecase.dart'
    as _i146;
import '../../features/profile/presentation/blocs/profile_bloc.dart' as _i133;
import '../../features/splash/domain/usecases/check_auth_usecase.dart' as _i77;
import '../../features/splash/presentation/blocs/splash_bloc.dart' as _i145;
import '../network/api_client.dart' as _i557;
import '../network/auth_interceptor.dart' as _i908;
import '../network/network_info.dart' as _i932;
import '../services/analytics_service.dart' as _i222;
import '../services/local_storage_service.dart' as _i527;
import '../services/notification_service.dart' as _i941;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final connectivityModule = _$ConnectivityModule();
    final sharedPreferencesModule = _$SharedPreferencesModule();
    gh.lazySingleton<_i895.Connectivity>(() => connectivityModule.connectivity);
    await gh.lazySingletonAsync<_i460.SharedPreferences>(
      () => sharedPreferencesModule.sharedPreferences,
      preResolve: true,
    );
    gh.lazySingleton<_i941.NotificationService>(
      () => _i941.NotificationService(),
    );
    gh.lazySingleton<_i527.LocalStorageService>(
      () => _i527.LocalStorageService(gh<_i460.SharedPreferences>()),
    );
    gh.lazySingleton<_i339.CartLocalDataSource>(
      () => _i339.CartLocalDataSourceImpl(gh<_i527.LocalStorageService>()),
    );
    gh.factory<_i908.AuthInterceptor>(
      () => _i908.AuthInterceptor(gh<_i527.LocalStorageService>()),
    );
    gh.factory<_i1046.ProfileLocalDataSource>(
      () => _i1046.ProfileLocalDataSourceImpl(gh<_i527.LocalStorageService>()),
    );
    gh.lazySingleton<_i222.AnalyticsService>(
      () => _i222.ConsoleAnalyticsService(),
    );
    gh.lazySingleton<_i322.CartRepository>(
      () => _i642.CartRepositoryImpl(gh<_i339.CartLocalDataSource>()),
    );
    gh.lazySingleton<_i557.ApiClient>(
      () => _i557.ApiClient(gh<_i908.AuthInterceptor>()),
    );
    gh.factory<_i327.ProfileRemoteDataSource>(
      () => _i327.ProfileRemoteDataSourceImpl(),
    );
    gh.factory<_i25.CheckoutLocalDataSource>(
      () => _i25.CheckoutLocalDataSourceImpl(gh<_i527.LocalStorageService>()),
    );
    gh.factory<_i77.CheckAuthUseCase>(
      () => _i77.CheckAuthUseCase(gh<_i527.LocalStorageService>()),
    );
    gh.factory<_i145.SplashBloc>(
      () => _i145.SplashBloc(gh<_i77.CheckAuthUseCase>()),
    );
    gh.factory<_i659.AddToCartUseCase>(
      () => _i659.AddToCartUseCase(gh<_i322.CartRepository>()),
    );
    gh.factory<_i342.GetCartItemsUseCase>(
      () => _i342.GetCartItemsUseCase(gh<_i322.CartRepository>()),
    );
    gh.factory<_i355.RemoveFromCartUseCase>(
      () => _i355.RemoveFromCartUseCase(gh<_i322.CartRepository>()),
    );
    gh.factory<_i495.UpdateCartItemUseCase>(
      () => _i495.UpdateCartItemUseCase(gh<_i322.CartRepository>()),
    );
    gh.lazySingleton<_i932.NetworkInfo>(
      () => _i932.NetworkInfoImpl(gh<_i895.Connectivity>()),
    );
    gh.factory<_i98.CartBloc>(
      () => _i98.CartBloc(
        gh<_i342.GetCartItemsUseCase>(),
        gh<_i659.AddToCartUseCase>(),
        gh<_i495.UpdateCartItemUseCase>(),
        gh<_i355.RemoveFromCartUseCase>(),
      ),
    );
    gh.factory<_i161.AuthRemoteDataSource>(
      () => _i306.AuthMockDataSource(gh<_i527.LocalStorageService>()),
    );
    gh.factory<_i787.AuthRepository>(
      () => _i153.AuthRepositoryImpl(
        gh<_i161.AuthRemoteDataSource>(),
        gh<_i932.NetworkInfo>(),
      ),
    );
    gh.factory<_i26.CheckoutRemoteDataSource>(
      () => _i26.CheckoutRemoteDataSourceImpl(gh<_i342.GetCartItemsUseCase>()),
    );
    gh.lazySingleton<_i963.ProductRemoteDataSource>(
      () => _i963.ProductRemoteDataSourceImpl(gh<_i557.ApiClient>()),
    );
    gh.factory<_i894.ProfileRepository>(
      () => _i334.ProfileRepositoryImpl(
        localDataSource: gh<_i1046.ProfileLocalDataSource>(),
        remoteDataSource: gh<_i327.ProfileRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i39.ProductRepository>(
      () => _i1040.ProductRepositoryImpl(gh<_i963.ProductRemoteDataSource>()),
    );
    gh.factory<_i188.LoginUseCase>(
      () => _i188.LoginUseCase(gh<_i787.AuthRepository>()),
    );
    gh.factory<_i48.LogoutUseCase>(
      () => _i48.LogoutUseCase(gh<_i787.AuthRepository>()),
    );
    gh.factory<_i57.SignupUseCase>(
      () => _i57.SignupUseCase(gh<_i787.AuthRepository>()),
    );
    gh.factory<_i133.GetProductDetailsUseCase>(
      () => _i133.GetProductDetailsUseCase(gh<_i39.ProductRepository>()),
    );
    gh.factory<_i85.AuthBloc>(
      () => _i85.AuthBloc(
        gh<_i188.LoginUseCase>(),
        gh<_i57.SignupUseCase>(),
        gh<_i48.LogoutUseCase>(),
      ),
    );
    gh.factory<_i303.GetOrderHistoryUseCase>(
      () => _i303.GetOrderHistoryUseCase(gh<_i894.ProfileRepository>()),
    );
    gh.factory<_i146.GetUserProfileUseCase>(
      () => _i146.GetUserProfileUseCase(gh<_i894.ProfileRepository>()),
    );
    gh.factory<_i498.CheckoutRepository>(
      () => _i949.CheckoutRepositoryImpl(
        remoteDataSource: gh<_i26.CheckoutRemoteDataSource>(),
        localDataSource: gh<_i25.CheckoutLocalDataSource>(),
      ),
    );
    gh.factory<_i1008.ProductBloc>(
      () => _i1008.ProductBloc(
        gh<_i133.GetProductDetailsUseCase>(),
        gh<_i659.AddToCartUseCase>(),
      ),
    );
    gh.factory<_i133.ProfileBloc>(
      () => _i133.ProfileBloc(
        getUserProfileUseCase: gh<_i146.GetUserProfileUseCase>(),
        getOrderHistoryUseCase: gh<_i303.GetOrderHistoryUseCase>(),
      ),
    );
    gh.factory<_i238.CreateOrderSummaryUseCase>(
      () => _i238.CreateOrderSummaryUseCase(gh<_i498.CheckoutRepository>()),
    );
    gh.factory<_i117.ProcessPaymentUseCase>(
      () => _i117.ProcessPaymentUseCase(gh<_i498.CheckoutRepository>()),
    );
    gh.factory<_i881.CheckoutBloc>(
      () => _i881.CheckoutBloc(
        createOrderSummaryUseCase: gh<_i238.CreateOrderSummaryUseCase>(),
        processPaymentUseCase: gh<_i117.ProcessPaymentUseCase>(),
      ),
    );
    return this;
  }
}

class _$ConnectivityModule extends _i932.ConnectivityModule {}

class _$SharedPreferencesModule extends _i527.SharedPreferencesModule {}
