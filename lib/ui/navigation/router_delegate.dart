import 'package:flutter/material.dart';
import 'package:mtc_xackaton/ui/pages/order_page/order_page.dart';

import '../pages/main_page/main_page.dart';
import '../pages/my_certificates_page/my_certificates_page.dart';
import 'navigation_state.dart';

class MyRouterDelegate extends RouterDelegate<NavigationState>
      with ChangeNotifier, PopNavigatorRouterDelegateMixin<NavigationState> {
  @override
  final GlobalKey<NavigatorState> navigatorKey;

  MyRouterDelegate() : navigatorKey = GlobalKey<NavigatorState>();

  NavigationState? _state;

  @override
  NavigationState get currentConfiguration {
    return _state ?? const NavigationStateMain(tab: MainTab.money);
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [];

    if (_state is NavigationStateMain) {
      pages.add(const MainPage());
    } else if (_state is NavigationStateList) {
      pages.add(const MainPage());
      pages.add(const MyCertificatesPage());
    } else if (_state is NavigationStateOrder) {
      pages.add(const MainPage());
      pages.add(const OrderPage());
    } else {
      pages.add(const MainPage());
    }

    // if (_state == null ||
    //     !context.read<TasksRepository>().state.isInitialized) {
    //   pages.add(LoadPage(nextPage: currentConfiguration));
    // } else if (_state != null) {
    //   pages.add(const MainPage());
    //
    //   if (_state!.name == Routes.edit) {
    //     pages.add(EditPage(taskIndex: _state!.taskIndex));
    //   }
    // }

    return Navigator(
      key: navigatorKey,
      pages: pages.map<Page>((page) => MaterialPage(child: page)).toList(),
      onPopPage: (route, result) {
        if (!route.didPop(result)) return false;

        _state = const NavigationStateMain(tab: MainTab.money);

        notifyListeners();
        return true;
      },
    );
  }

  @override
  Future<void> setNewRoutePath(NavigationState configuration) async {
    _state = configuration;
    notifyListeners();
  }
}