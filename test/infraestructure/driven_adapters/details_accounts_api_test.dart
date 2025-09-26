import 'dart:convert';
import 'package:double_v_partners_app/src/infraestructure/driven_adapters/details_accounts_api.dart';
import 'package:double_v_partners_app/src/infraestructure/driven_adapters/localstorage_api.dart';
import 'package:dvp_components/dvp_components.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import '../../mocks/mocks.dart'; // si tienes mocks centralizados

void main() {
  late DetailsAccountApi api;
  late MockLocalStorageApi mockStorage;

  setUp(() {
    mockStorage = MockLocalStorageApi();
    api = DetailsAccountApi();

    LocalStorageApi.overrideInstance(mockStorage);
  });

  test('loadData devuelve una instancia AccountModel correctamente', () async {
    final mockJsonList = jsonEncode({
      'id': '1',
      'name': 'Camilo',
      'lastname': 'Galvis',
      'birthday': '1995-01-01',
      'address': [],
    });

    when(() => mockStorage.get('1')).thenAnswer((_) async => mockJsonList);

    final result = await api.loadData('1');

    final error = result.$1;
    final account = result.$2;

    expect(error, isNull);
    expect(account, isNotNull);
    expect(account, isInstanceOf<AccountModel>());

    verify(() => mockStorage.get('1')).called(1);
  });
}
