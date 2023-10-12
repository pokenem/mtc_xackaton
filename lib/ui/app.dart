import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:mtc_xackaton/ui/navigation/navigation_manager.dart';

import '../domain/app_cubit.dart';
import 'navigation/navigation_state.dart';
import 'navigation/router_delegate.dart';
import 'navigation/router_information_parser.dart';

class App extends StatelessWidget {
  late final RouterDelegate<NavigationState> _routerDelegate;
  final RouteInformationParser<NavigationState> _routeInformationParser;
  final AppCubit appCubit;

  App({super.key})
      : _routerDelegate = MyRouterDelegate(),
        _routeInformationParser = MyRouteInformationParser(),
        appCubit = AppCubit() {
    GetIt.I.registerSingleton(NavMan(routerDelegate: _routerDelegate));
  }

  Future<void> _init() async {
    await appCubit.init();
  }

  @override
  Widget build(BuildContext context) {
    print('222');
    return BlocProvider<AppCubit>(
      lazy: false,
      create: (context) {
        _init();

        return appCubit;
      },
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: 'MTS Hackathon',
        routerDelegate: _routerDelegate,
        routeInformationParser: _routeInformationParser,
      ),
    );
  }
}
