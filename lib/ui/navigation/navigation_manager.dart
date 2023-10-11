import 'package:flutter/cupertino.dart';

import 'navigation_state.dart';

class NavigationManager {
  final RouterDelegate<NavigationState> _routerDelegate;

  const NavigationManager({required RouterDelegate<NavigationState> routerDelegate})
      : _routerDelegate = routerDelegate;

  void openMainPage() {
    _routerDelegate.setNewRoutePath(const NavigationStateMain(tab: MainTab.money));
  }

  void openMyCertificatesPage() {
    _routerDelegate.setNewRoutePath(const NavigationStateList());
  }

  void pop() {
    _routerDelegate.popRoute();
  }
}
