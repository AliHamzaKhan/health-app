

class AppEnvironment {
  static final String _env = String.fromEnvironment('ENV', defaultValue: ApiEnvironmentEnum.Prod.value);

  static String env() {
    return _env;
  }

  static String apiUrl() {
    switch (_env) {
      case 'prod':
        return 'https://teletixapp.crescenttrack.com:8888/api/';
      case 'staging':
        return 'http://203.128.254.251:1949/api/';
      case 'debug':
        return 'https://teletixapp.crescenttrack.com:8888/api';
      default:
        return '';
    }
  }

  static String chatApiUrl() {
    switch (_env) {
      case 'prod':
        return "https://teletixapp.crescenttrack.com:8888/api/";
      case 'staging':
        return "http://web.teletix.pk:1949/api/";
      case 'debug':
        return 'http://web.teletix.pk:1949/api/';
      default:
        return '';
    }
  }
}

enum ApiEnvironmentEnum {
  Prod('prod'),
  Staging('staging'),
  Debug('debug');

  const ApiEnvironmentEnum(this.value);

  final String value;
}
