import 'package:dvp_components/dvp_components.dart';
import 'package:flutter/material.dart';

import '../../infraestructure/driven_adapters/details_accounts_api.dart';

class DetailsAccountRoutes {
  static const String routeName = DetailsAccountScreen.routeName;

  DetailsAccountRoutes._();

  static DetailsAccountScreen getDetailsAccountScreen(BuildContext context) {
    return DetailsAccountScreen(
      args: DetailsAccountArgs(
        modelUI: _language(context),
        config: DetailsAccountConfig(DetailsAccountApi()),
        onCompleted: () {},
      ),
    );
  }

  static Map<String, dynamic> _language(BuildContext context) {
    final locale = DVPDetailsAccountLocalizations.of(context)
        as DVPDetailsAccountLocalizations;

    return locale.getJson() as Map<String, dynamic>;
  }
}
