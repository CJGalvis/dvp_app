import 'dart:convert';
import 'dart:math';

import 'package:dvp_components/dvp_components.dart';

import '../mocks/create_account_mocks.dart';
import 'localstorage_api.dart';

class CreateAccountApi extends CreateAccountGateway {
  @override
  Future<(ErrorItem?, bool)> createAccount(AccountModel user) async {
    final id = Random().nextInt(1000).toString();
    user.id = id;
    final jsonString = jsonEncode(user.toJson());

    await LocalStorageApi.instance.save(id, jsonString);
    return CreateAccountMocks.createAccountResponse(user);
  }

  @override
  Future<(ErrorItem?, Map<String, dynamic>)> loadDataForm() async {
    return CreateAccountMocks.loadDataForm();
  }
}
