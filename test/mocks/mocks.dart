import 'package:double_v_partners_app/src/infraestructure/driven_adapters/localstorage_api.dart';
import 'package:flutter/material.dart';
import 'package:mocktail/mocktail.dart';

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

class FakeRoute extends Fake implements Route<dynamic> {}

class MockLocalStorageApi extends Mock implements LocalStorageApi {}