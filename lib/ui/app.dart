import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mtc_xackaton/ui/navigation/navigation_manager.dart';

import 'navigation/navigation_state.dart';
import 'navigation/router_delegate.dart';
import 'navigation/router_information_parser.dart';

class App extends StatelessWidget {
  final RouterDelegate<NavigationState> _routerDelegate;
  final RouteInformationParser<NavigationState> _routeInformationParser;

  App({super.key})
      : _routerDelegate = MyRouterDelegate(),
        _routeInformationParser = MyRouteInformationParser() {
    GetIt.I
        .registerSingleton(NavigationManager(routerDelegate: _routerDelegate));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'MTS Hackathon',
      routerDelegate: _routerDelegate,
      routeInformationParser: _routeInformationParser,
    );
  }
}
