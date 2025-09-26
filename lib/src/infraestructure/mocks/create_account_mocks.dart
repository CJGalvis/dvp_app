import 'package:dvp_components/dvp_components.dart';

class CreateAccountMocks {
  static Future<(ErrorItem?, bool)> createAccountResponse(AccountModel user) {
    switch (user.name) {
      case 'prueba1':
        return Future.value(
          (
            ErrorItem(message: 'Ocurrió un error'),
            false,
          ),
        );
      default:
        return Future.value((null, true));
    }
  }

  static Future<(ErrorItem?, Map<String, dynamic>)> loadDataForm() {
    return Future.value((
      null,
      {
        'regions': [
          'Antioquia',
          'Cundinamarca',
          'Bolivar',
          'Atlantico',
          'Sucre',
          'Córdoba',
        ],
        'cities': [
          'Medellin',
          'Bogota',
          'Sincelejo',
          'Montería',
          'Baranquilla',
          'Cartagena',
        ]
      }
    ));
  }
}
