enum AppEnvironment { dev, staging, prod }

abstract class EnvInfo {
  static AppEnvironment _environment = AppEnvironment.dev;

  static set environment(AppEnvironment environment) {
    EnvInfo._environment = environment;
  }

  static String get appName => _environment._appTitle;
  static String get envName => _environment._envName;
  static String get baseUrl => _environment._baseUrl;
  static AppEnvironment get environment => _environment;
  static bool get isProduction => _environment == AppEnvironment.prod;
}

extension _EnvProperties on AppEnvironment {
  static const _appTitles = {
    AppEnvironment.dev: 'Miniarch Dev',
    AppEnvironment.staging: 'Miniarch Staging',
    AppEnvironment.prod: 'Miniarch',
  };

  static const _connectionStrings = {
    AppEnvironment.dev: 'https://test.com/api',
    AppEnvironment.staging: 'https://test.com/api',
    AppEnvironment.prod: 'https://test.com/api',
  };

  static const _envs = {
    AppEnvironment.dev: 'dev',
    AppEnvironment.staging: 'staging',
    AppEnvironment.prod: 'prod',
  };

  String get _appTitle => _appTitles[this]!;
  String get _envName => _envs[this]!;
  String get _baseUrl => _connectionStrings[this]!;
}
