import 'package:injectable/injectable.dart';

/// Interface for analytics tracking
abstract class AnalyticsService {
  void logEvent(String eventName, {Map<String, dynamic>? parameters});
  void logScreenView(String screenName);
  void setUserId(String userId);
  void setUserProperty(String name, String value);
}

/// Console implementation of AnalyticsService for debugging
@LazySingleton(as: AnalyticsService)
class ConsoleAnalyticsService implements AnalyticsService {
  @override
  void logEvent(String eventName, {Map<String, dynamic>? parameters}) {
    print('=Ê Analytics Event: $eventName');
    if (parameters != null && parameters.isNotEmpty) {
      print('   Parameters: $parameters');
    }
  }

  @override
  void logScreenView(String screenName) {
    print('=ñ Screen View: $screenName');
  }

  @override
  void setUserId(String userId) {
    print('=d User ID Set: $userId');
  }

  @override
  void setUserProperty(String name, String value) {
    print('<÷  User Property: $name = $value');
  }
}
