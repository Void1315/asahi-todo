// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i6;
import 'package:firebase_analytics/firebase_analytics.dart' as _i4;
import 'package:firebase_crashlytics/firebase_crashlytics.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../firebase/analytics/firebase_analytics_impl.dart' as _i3;
import '../firebase/crashlytics_service.dart' as _i7;
import 'module/firebase_module.dart' as _i8;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final firebaseModule = _$FirebaseModule();
    gh.factory<_i3.Analytics>(() => _i3.FirebaseAnalyticsImpl());
    gh.singleton<_i4.FirebaseAnalytics>(firebaseModule.firebaseAnalytics);
    gh.singleton<_i5.FirebaseCrashlytics>(firebaseModule.firebaseCrashlytics);
    gh.singleton<_i6.FirebaseFirestore>(firebaseModule.firebaseFireStore);
    gh.lazySingleton<_i7.CrashlyticsService>(
        () => _i7.CrashlyticsService(gh<_i5.FirebaseCrashlytics>()));
    return this;
  }
}

class _$FirebaseModule extends _i8.FirebaseModule {}
