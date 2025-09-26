import 'package:double_v_partners_app/src/infraestructure/driven_adapters/localstorage_api.dart';
import 'package:double_v_partners_app/src/ui/routes/create_account_routes.dart';
import 'package:double_v_partners_app/src/ui/routes/details_account_routes.dart';
import 'package:double_v_partners_app/src/ui/routes/list_accounts_routes.dart';
import 'package:dvp_components/dvp_components.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorageApi.instance.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DoubleVPartners',
      initialRoute: ListAccountsRoutes.routeName,
      routes: {
        ListAccountsRoutes.routeName: (context) =>
            ListAccountsRoutes.getListAccountsScreen(context),
        CreateAccountRoutes.routeName: (context) =>
            CreateAccountRoutes.getCreateAccountScreen(context),
        DetailsAccountRoutes.routeName: (context) =>
            DetailsAccountRoutes.getDetailsAccountScreen(context)
      },
      localizationsDelegates: const [
        DVPCreateAccountLocalizations.delegate,
        DVPListAccountsLocalizations.delegate,
        DVPDetailsAccountLocalizations.delegate,
      ],
    );
  }
}
