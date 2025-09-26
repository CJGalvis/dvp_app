import 'dart:async';
import 'dart:convert';

import 'package:double_v_partners_app/src/infraestructure/driven_adapters/localstorage_api.dart';
import 'package:dvp_components/dvp_components.dart';

class ListAccountsApi extends ListAccountsGateway {
  @override
  Future<(ErrorItem?, List<AccountModel>?)> getAccounts() async {
    await Future.delayed(Duration(seconds: 2));
    final response = await LocalStorageApi.getAllAsList();
    final data = response.map((e) => AccountModel.fromJson(jsonDecode(e))).toList();
    return Future.value((null, data));
  }
}
