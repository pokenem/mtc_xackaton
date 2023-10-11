import 'package:flutter/cupertino.dart';

import '../../model/certificate.dart';
import 'navigation_state.dart';

class NavigationManager {
  final RouterDelegate<NavigationState> _routerDelegate;

  const NavigationManager(
      {required RouterDelegate<NavigationState> routerDelegate})
      : _routerDelegate = routerDelegate;

  void openMainPage() {
    _routerDelegate
        .setNewRoutePath(const NavigationStateMain(tab: MainTab.money));
  }

  void openMyCertificatesPage() {
    _routerDelegate.setNewRoutePath(const NavigationStateList());
  }

  void openOrderPage(Certificate certificate) {
    _routerDelegate
        .setNewRoutePath(NavigationStateOrder(certificate: certificate));
  }

  void pop() {
    _routerDelegate.popRoute();
  }
}
