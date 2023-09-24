class Environment {
  late final EnvironmentType currentEnvironment;
  Environment(){
    currentEnvironment = const bool.fromEnvironment('dart.vm.product')
    ? EnvironmentType.production
    : EnvironmentType.development;
  }
}


enum EnvironmentType {
  development,
  testing,
  staging,
  production,
}