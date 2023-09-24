/*
 * ----------------------------------------------------------------------------
 *
 * This file is part of the FireKart open-source project, available at:
 * https://github.com/ashishrawat2911/firekart
 *
 * Created by: Ashish Rawat
 * ----------------------------------------------------------------------------
 *
 * Copyright (c) 2020 Ashish Rawat
 *
 * Licensed under the MIT License.
 *
 * ----------------------------------------------------------------------------
 */
library firebase_impl;

import 'package:asahi_todo/core/utils/environment.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:asahi_todo/firebase_options_dev.dart' as dev;
import 'package:asahi_todo/firebase_options.dart' as prod;

Future<void> initializeFirebase() async {
  late final FirebaseOptions options; // 用来区分不同环境的firebase配置
  var currentEnvironment = Environment().currentEnvironment;
  switch (currentEnvironment) {
    case EnvironmentType.production:
      options = prod.DefaultFirebaseOptions.currentPlatform;
      break;
    case EnvironmentType.development:
      options = dev.DefaultFirebaseOptions.currentPlatform;
      break;
    default:
      options = dev.DefaultFirebaseOptions.currentPlatform;
      break;
  }
  await Firebase.initializeApp(
    options: options,
  );
}
