import 'package:flutter/cupertino.dart';

import '../../model/certificate.dart';
import 'navigation_state.dart';

class NavMan {
  final RouterDelegate<NavigationState> _routerDelegate;

  const NavMan({
    required RouterDelegate<NavigationState> routerDelegate,
  }) : _routerDelegate = routerDelegate;

  void openMainPage() {
    _routerDelegate.setNewRoutePath(const NavigationStateMain());
  }

  void openMyCertificatesPage() {
    _routerDelegate.setNewRoutePath(const NavigationStateMyCertificates());
  }

  void openOrderPage(Certificate cert) {
    _routerDelegate.setNewRoutePath(NavigationStateOrder(cert: cert));
  }

  void openCertificateInfoPage(CertificateService cert) {
    _routerDelegate.setNewRoutePath(NavigationStateCertificateInfo(cert: cert));
  }

  void openErrorPage(String error) {
    _routerDelegate.setNewRoutePath(NavigationStateError(error: error));
  }

  void pop() {
    _routerDelegate.popRoute();
  }
}
