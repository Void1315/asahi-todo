import 'dart:async';

import 'package:asahi_todo/core/logger/app_logger.dart';
import 'package:asahi_todo/firebase/crashlytics_service.dart';
import 'package:asahi_todo/firebase/firebase_impl.dart';
import 'package:flutter/material.dart';
import 'di/di.dart';
import 'app/app.dart';

class Initializer {
  Initializer._();
  static Future<void> initialize(ValueChanged<Widget> onRun) async {
    runZonedGuarded(() async {
      WidgetsFlutterBinding
          .ensureInitialized(); // 必须使用此方法来初始化Flutter应用程序绑定，否则会导致应用程序崩溃
      await initializeFirebase(); // 用来初始化谷歌firebase服务
      await registerDependencies(); // 用来注册依赖项
      onRun(App());
    }, (error, stack) {
      // 设置全局异常捕获
      AppLogger.log(
        'App level error',
        logType: LogType.error,
        error: error,
        stackTrace: stack,
      );
      inject<CrashlyticsService>().recordError(error, stack);
    });
  }
}
