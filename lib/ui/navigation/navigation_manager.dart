import 'package:flutter/cupertino.dart';

import '../../model/certificate.dart';
import 'navigation_state.dart';

class NavMan {
  final RouterDelegate<NavigationState> _routerDelegate;

  const NavMan({
    required RouterDelegate<NavigationState> routerDelegate,
  }) : _routerDelegate = routerDelegate;

  void openMainPage() {
    _routerDelegate
        .setNewRoutePath(const NavigationStateMain(tab: MainTab.money));
  }

  void openMyCertificatesPage() {
    _routerDelegate.setNewRoutePath(const NavigationStateList());
  }

  void openOrderPage(Certificate certificate) {
    _routerDelegate
        .setNewRoutePath(NavigationStateOrder(cert: certificate));
  }

  void pop() {
    _routerDelegate.popRoute();
  }
}
