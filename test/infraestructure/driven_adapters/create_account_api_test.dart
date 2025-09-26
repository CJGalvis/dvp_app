import 'dart:convert';
import 'package:double_v_partners_app/src/infraestructure/driven_adapters/create_account_api.dart';
import 'package:double_v_partners_app/src/infraestructure/driven_adapters/localstorage_api.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dvp_components/dvp_components.dart';

import '../../mocks/mocks.dart';

void main() {
  late CreateAccountApi api;
  late MockLocalStorageApi mockStorage;

  setUp(() {
    mockStorage = MockLocalStorageApi();
    api = CreateAccountApi();

    LocalStorageApi.overrideInstance(mockStorage);
  });

  test('createAccount guarda el usuario y genera un id', () async {
    final user = AccountModel(
      name: 'Camilo',
      lastname: 'Galvis',
      birthday: '1995-01-01',
      address: [],
    );

    when(() => mockStorage.save(any(), any())).thenAnswer((_) async => {});

    final result = await api.createAccount(user);

    expect(user.id, isNotEmpty);

    verify(() => mockStorage.save(user.id!, jsonEncode(user.toJson())))
        .called(1);

    expect(result.$2, isTrue);
  });

  test('loadDataForm devuelve la estructura correcta', () async {
    final result = await api.loadDataForm();

    expect(result.$2, isA<Map<String, dynamic>>());
  });
}
