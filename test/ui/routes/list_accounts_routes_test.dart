import 'package:double_v_partners_app/src/infraestructure/driven_adapters/localstorage_api.dart';
import 'package:double_v_partners_app/src/ui/routes/create_account_routes.dart';
import 'package:double_v_partners_app/src/ui/routes/list_accounts_routes.dart';
import 'package:dvp_components/dvp_components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../mocks/mocks.dart';

void main() {
  late MockLocalStorageApi mockStorage;

  setUp(() {
    mockStorage = MockLocalStorageApi();
    LocalStorageApi.overrideInstance(mockStorage);
    registerFallbackValue(FakeRoute());
    when(() => mockStorage.getAllAsList()).thenAnswer((_) async => []);
  });

  tearDown(() {
    reset(mockStorage);
  });

  testWidgets(
      'ListAccountsRoutes.getListAccountsScreen devuelve un ListAccountsScreen',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        localizationsDelegates: const [
          DVPListAccountsLocalizations.delegate,
        ],
        routes: {
          ListAccountsRoutes.routeName: (context) =>
              ListAccountsRoutes.getListAccountsScreen(context),
        },
        home: Builder(
          builder: (context) {
            return ListAccountsRoutes.getListAccountsScreen(context);
          },
        ),
      ),
    );

    await tester.pumpAndSettle();

    expect(find.byType(ListAccountsScreen), findsOneWidget);
  });

  testWidgets('al presionar el floating button navega a CreateAccountScreen',
      (WidgetTester tester) async {
    final mockObserver = MockNavigatorObserver();

    await tester.pumpWidget(
      MaterialApp(
        navigatorObservers: [mockObserver],
        localizationsDelegates: const [
          DVPListAccountsLocalizations.delegate,
          DVPCreateAccountLocalizations.delegate,
        ],
        routes: {
          ListAccountsRoutes.routeName: (context) =>
              ListAccountsRoutes.getListAccountsScreen(context),
          CreateAccountRoutes.routeName: (context) =>
              CreateAccountRoutes.getCreateAccountScreen(context),
        },
        home: Builder(
          builder: (context) {
            return ListAccountsRoutes.getListAccountsScreen(context);
          },
        ),
      ),
    );

    await tester.pump();
    await tester.pumpAndSettle();

    final fabFinder = find.byType(FloatingActionButton);
    expect(fabFinder, findsOneWidget);

    reset(mockObserver);

    await tester.tap(fabFinder);
    await tester.pumpAndSettle(const Duration(seconds: 5));

    expect(find.byType(CreateAccountScreen), findsOneWidget);
    verify(() => mockObserver.didPush(any(), any())).called(1);
  });
}
