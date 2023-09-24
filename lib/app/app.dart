import 'package:asahi_todo/core/logger/app_logger.dart';
import 'package:asahi_todo/di/di.dart';
import 'package:asahi_todo/firebase/analytics/firebase_analytics_impl.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:asahi_todo/app/routes/app_router.dart';


class App extends StatelessWidget {
  FirebaseAnalytics analytics = inject<Analytics>().analytics;

  App({Key? key}) : super(key: key) {
    _setUserId();
    _setUserProperty();
  }

  Future<void> _setUserId() async {
    await analytics.setAnalyticsCollectionEnabled(false);
    await analytics.setAnalyticsCollectionEnabled(true);
    String? id = await analytics.appInstanceId;
    await analytics.setUserId(id: 'wuhu');
    AppLogger.log(
      id,
      logType: LogType.debug,
    );
    AppLogger.log(
      'setUserId',
      logType: LogType.debug,
    );
  }

  Future<void> _setUserProperty() async {
    await analytics.setUserProperty(name: 'ccc', value: 'bbb');
    AppLogger.log(
      'setUserProperty',
      logType: LogType.debug,
    );
  }

  // @override
  // // 使用ReduxProvider包裹整个应用程序
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     title: 'Asahi Todo',
  //     home: Scaffold(
  //         appBar: AppBar(
  //           title: const Text('Flutter layout demo'),
  //         ),
  //         body: Center(
  //           child: InkWell(
  //             child: Text("data"),
  //             onTap: () {
  //               inject<Analytics>().logEvent(name: "date", value: "9-23");
  //             },
  //           ),
  //         )),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
    );
  }
}
