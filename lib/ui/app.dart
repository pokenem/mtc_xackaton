import 'package:flutter/material.dart';

import 'navigation/navigation_state.dart';
import 'navigation/router_delegate.dart';
import 'navigation/router_information_parser.dart';

class App extends StatelessWidget {
  final RouterDelegate<NavigationState> _routerDelegate;
  final RouteInformationParser<NavigationState> _routeInformationParser;

  App({super.key})
      : _routerDelegate = MyRouterDelegate(),
        _routeInformationParser = MyRouteInformationParser();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "MTS Hackaton",
      routerDelegate: _routerDelegate,
      routeInformationParser: _routeInformationParser,
    );
  }
}
