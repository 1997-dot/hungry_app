import 'package:flutter/foundation.dart';
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
    debugPrint('[Analytics] Event: $eventName');
    if (parameters != null && parameters.isNotEmpty) {
      debugPrint('[Analytics]   Parameters: $parameters');
    }
  }

  @override
  void logScreenView(String screenName) {
    debugPrint('[Analytics] Screen View: $screenName');
  }

  @override
  void setUserId(String userId) {
    debugPrint('[Analytics] User ID Set: $userId');
  }

  @override
  void setUserProperty(String name, String value) {
    debugPrint('[Analytics] User Property: $name = $value');
  }
}
