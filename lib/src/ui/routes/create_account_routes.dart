import 'package:double_v_partners_app/src/ui/routes/list_accounts_routes.dart';
import 'package:dvp_components/dvp_components.dart';
import 'package:flutter/material.dart';

import '../../infraestructure/driven_adapters/create_account_api.dart';

class CreateAccountRoutes {
  CreateAccountRoutes._();
  static const String routeName = CreateAccountScreen.routeName;

  static CreateAccountScreen getCreateAccountScreen(BuildContext context) {
    return CreateAccountScreen(
      args: CreateAccountArgs(
        modelUI: _language(context),
        config: CreateAccountConfig(CreateAccountApi()),
        onCompleted: () => Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
            builder: (context) =>
                ListAccountsRoutes.getListAccountsScreen(context),
          ),
          (Route<dynamic> route) => false,
        ),
      ),
    );
  }

  static Map<String, dynamic> _language(BuildContext context) {
    final locale = DVPCreateAccountLocalizations.of(context)
        as DVPCreateAccountLocalizations;

    return locale.getJson() as Map<String, dynamic>;
  }
}
