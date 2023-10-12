import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtc_xackaton/ui/pages/certificate_info_page/certificate_info_page.dart';
import 'package:mtc_xackaton/ui/pages/loading_page/loading_page.dart';
import 'package:mtc_xackaton/ui/pages/order_page/order_page.dart';

import '../../domain/app_cubit.dart';
import '../pages/main_page/main_page.dart';
import '../pages/my_certificates_page/my_certificates_page.dart';
import 'navigation_state.dart';

class MyRouterDelegate extends RouterDelegate<NavigationState>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<NavigationState> {
  @override
  final GlobalKey<NavigatorState> navigatorKey;

  MyRouterDelegate()
      : navigatorKey = GlobalKey<NavigatorState>(),
        _state = const NavigationStateLoading();

  NavigationState _state;

  @override
  NavigationState get currentConfiguration => _state;

  @override
  Widget build(BuildContext context) {
    final List<Widget> pages = [];

    if (context.read<AppCubit>().state is AppStateLoading) {
      pages.add(const LoadingPage());
    } else {
      if (_state is NavigationStateMain) {
        pages.add(const MainPage());
      } else if (_state is NavigationStateMyCertificates) {
        pages.add(const MainPage());
        pages.add(const MyCertificatesPage());
      } else if (_state is NavigationStateOrder) {
        NavigationStateOrder state = _state as NavigationStateOrder;

        pages.add(const MainPage());
        pages.add(OrderPage(cert: state.cert));
      } else if (_state is NavigationStateCertificateInfo) {
        NavigationStateCertificateInfo state = _state as NavigationStateCertificateInfo;

        pages.add(const MainPage());
        pages.add(CertificateInfoPage(cert: state.cert));
      } else {
        pages.add(const MainPage());
      }
    }

    return Navigator(
      key: navigatorKey,
      pages: pages.map<Page>((page) => MaterialPage(child: page)).toList(),
      onPopPage: (route, result) {
        if (!route.didPop(result)) return false;

        _state = const NavigationStateMain();

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
