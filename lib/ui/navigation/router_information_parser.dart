import 'package:flutter/material.dart';

import 'navigation_state.dart';

class MyRouteInformationParser extends RouteInformationParser<NavigationState> {
  @override
  Future<NavigationState> parseRouteInformation(
      RouteInformation routeInformation,
      ) async {
    final location = routeInformation.location;

    if (location == null) {
      return const NavigationStateMain(tab: MainTab.money);
    }

    final uri = Uri.parse(location);

    if (uri.pathSegments.length == 1) {
      if (uri.pathSegments[0] == 'money') {
        return const NavigationStateMain(tab: MainTab.money);
      } else if (uri.pathSegments[0] == 'service') {
        return const NavigationStateMain(tab: MainTab.service);
      } else if (uri.pathSegments[0] == 'list') {
        return const NavigationStateList();
      }
    } else if (uri.pathSegments.length == 2) {
      if (uri.pathSegments[0] == 'certificateInfo') {
        return NavigationStateCertificateInfo(certificateId: uri.pathSegments[1]);
      } else if (uri.pathSegments[0] == 'gift') {
        return NavigationStateAcceptGift(giftId: uri.pathSegments[1]);
      }
    }

    return const NavigationStateMain(tab: MainTab.money);
  }

  @override
  RouteInformation? restoreRouteInformation(NavigationState configuration) {
    if (configuration is NavigationStateMain) {
      NavigationStateMain state = configuration;

      if (state.tab == MainTab.money) {
        return const RouteInformation(location: '/money');
      } else {
        return const RouteInformation(location: '/service');
      }
    } else if (configuration is NavigationStateList) {
      return const RouteInformation(location: '/list');
    } else if (configuration is NavigationStateCertificateInfo) {
      NavigationStateCertificateInfo state = configuration;

      return RouteInformation(location: '/certificateInfo/${state.certificateId}');
    } else if (configuration is NavigationStateAcceptGift) {
      NavigationStateAcceptGift state = configuration;

      return RouteInformation(location: '/certificateInfo/${state.giftId}');
    }

    return const RouteInformation(location: '/');
  }
}