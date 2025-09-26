import 'dart:convert';

import 'package:dvp_components/dvp_components.dart';

import 'localstorage_api.dart';

class DetailsAccountApi extends DetailsAccountGateway {
  @override
  Future<(ErrorItem?, AccountModel)> loadData(String id) async {
    await Future.delayed(Duration(seconds: 2));
    final response = await LocalStorageApi.get(id);
    final data = AccountModel.fromJson(jsonDecode(response ?? ''));
    return Future.value((null, data));
  }
}
