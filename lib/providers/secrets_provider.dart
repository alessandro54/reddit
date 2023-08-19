import 'package:flutter_dotenv/flutter_dotenv.dart';

class SecretsProvider {
  String _apiUrl, _oauthUrl, _clientId, _clientSecret, _password;

  SecretsProvider._privateConstructor()
      : _apiUrl = dotenv.env['FLUTTER_APP_API_URL']!,
        _oauthUrl = dotenv.env['FLUTTER_OAUTH_API_URL']!,
        _clientId = dotenv.env['FLUTTER_APP_CLIENT_ID']!,
        _clientSecret = dotenv.env['FLUTTER_APP_CLIENT_SECRET']!,
        _password = dotenv.env['FLUTTER_APP_PASSWORD']!;

  static final SecretsProvider _instance =
      SecretsProvider._privateConstructor();

  factory SecretsProvider() {
    return _instance;
  }

  String get apiUrl => _apiUrl;

  String get clientId => _clientId;

  String get clientSecret => _clientSecret;

  String get oauthUrl => _oauthUrl;

  String get password => _password;
}
