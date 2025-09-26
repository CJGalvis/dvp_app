import 'dart:convert';
import 'package:double_v_partners_app/src/infraestructure/driven_adapters/list_accounts_api.dart';
import 'package:double_v_partners_app/src/infraestructure/driven_adapters/localstorage_api.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../mocks/mocks.dart'; // si tienes mocks centralizados

void main() {
  late ListAccountsApi api;
  late MockLocalStorageApi mockStorage;

  setUp(() {
    mockStorage = MockLocalStorageApi();
    api = ListAccountsApi();

    LocalStorageApi.overrideInstance(mockStorage);
  });

  test('getAccounts devuelve la lista de AccountModel correctamente', () async {
    final mockJsonList = [
      jsonEncode({
        'id': '1',
        'name': 'Camilo',
        'lastname': 'Galvis',
        'birthday': '1995-01-01',
        'address': [],
      }),
      jsonEncode({
        'id': '2',
        'name': 'Juan',
        'lastname': 'Perez',
        'birthday': '1990-05-20',
        'address': [],
      }),
    ];

    when(() => mockStorage.getAllAsList())
        .thenAnswer((_) async => mockJsonList);

    final result = await api.getAccounts();

    final error = result.$1;
    final accounts = result.$2;

    expect(error, isNull);
    expect(accounts, isNotNull);
    expect(accounts!.length, greaterThan(0));

    verify(() => mockStorage.getAllAsList()).called(1);
  });
}
