import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'di.config.dart';

final GetIt getIt = GetIt.I;

@InjectableInit(
  preferRelativeImports: true, // default
  asExtension: true, // default
)
Future<GetIt> registerDependencies() async => getIt.init();

T inject<T extends Object>({
  String? instanceName,
  dynamic param1,
  dynamic param2,
}) =>
    getIt<T>(instanceName: instanceName, param1: param1, param2: param2);
