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

import '../network/api_client.dart' as _i557;
import '../network/network_info.dart' as _i932;
import '../services/analytics_service.dart' as _i222;
import '../services/local_storage_service.dart' as _i527;
import '../services/navigation_service.dart' as _i31;
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
    gh.lazySingleton<_i557.ApiClient>(() => _i557.ApiClient());
    gh.lazySingleton<_i895.Connectivity>(() => connectivityModule.connectivity);
    await gh.lazySingletonAsync<_i460.SharedPreferences>(
      () => sharedPreferencesModule.sharedPreferences,
      preResolve: true,
    );
    gh.lazySingleton<_i31.NavigationService>(() => _i31.NavigationService());
    gh.lazySingleton<_i941.NotificationService>(
      () => _i941.NotificationService(),
    );
    gh.lazySingleton<_i527.LocalStorageService>(
      () => _i527.LocalStorageService(gh<_i460.SharedPreferences>()),
    );
    gh.lazySingleton<_i222.AnalyticsService>(
      () => _i222.ConsoleAnalyticsService(),
    );
    gh.lazySingleton<_i932.NetworkInfo>(
      () => _i932.NetworkInfoImpl(gh<_i895.Connectivity>()),
    );
    return this;
  }
}

class _$ConnectivityModule extends _i932.ConnectivityModule {}

class _$SharedPreferencesModule extends _i527.SharedPreferencesModule {}
