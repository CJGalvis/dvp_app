import 'package:double_v_partners_app/src/infraestructure/driven_adapters/list_accounts_api.dart';
import 'package:dvp_components/dvp_components.dart';
import 'package:flutter/material.dart';

import 'details_account_routes.dart';

class ListAccountsRoutes {
  static const String routeName = ListAccountsScreen.routeName;

  ListAccountsRoutes._();

  static ListAccountsScreen getListAccountsScreen(BuildContext context) {
    return ListAccountsScreen(
      args: ListAccountsArgs(
        modelUI: _language(context),
        config: ListAccountsConfig(ListAccountsApi()),
        onSelectItem: (item) => Navigator.pushNamed(
          context,
          DetailsAccountRoutes.routeName,
          arguments: item.id,
        ),
        onPressedFloatingButton: () =>
            Navigator.pushNamed(context, CreateAccountScreen.routeName),
      ),
    );
  }

  static Map<String, dynamic> _language(BuildContext context) {
    final locale = DVPListAccountsLocalizations.of(context)
        as DVPListAccountsLocalizations;

    return locale.getJson() as Map<String, dynamic>;
  }
}
