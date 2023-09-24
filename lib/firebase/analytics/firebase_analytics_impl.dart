import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:injectable/injectable.dart' hide Order;
import 'package:injectable/injectable.dart';

abstract class Analytics {
  late final FirebaseAnalytics analytics;
  void logEvent({required String name, required Object value});

  void logEventWithParam({
    required String name,
    Map<String, Object?>? parameters,
  });
}

@Injectable(as: Analytics)
class FirebaseAnalyticsImpl extends Analytics {
  FirebaseAnalyticsImpl() {
    analytics = FirebaseAnalytics.instance;
  }

  @override
  void logEvent({required String name, required Object value}) {
    analytics.logEvent(name: name, parameters: {'value': value});
  }

  @override
  void logEventWithParam({
    required String name,
    Map<String, Object?>? parameters,
  }) {
    analytics.logEvent(name: name, parameters: parameters);
  }
}
