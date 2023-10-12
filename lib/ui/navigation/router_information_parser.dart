import 'package:flutter/material.dart';

import 'navigation_state.dart';

class MyRouteInformationParser extends RouteInformationParser<NavigationState> {
  @override
  Future<NavigationState> parseRouteInformation(
    RouteInformation routeInformation,
  ) async {
    final location = routeInformation.location;

    if (location == null) {
      return const NavigationStateMain();
    }

    final uri = Uri.parse(location);

    if (uri.pathSegments.isEmpty) {
      return const NavigationStateMain();
    } else if (uri.pathSegments.length == 1) {
      if (uri.pathSegments[0] == 'myCertificates') {
        return const NavigationStateMyCertificates();
      }
    } else if (uri.pathSegments.length == 2) {
      if (uri.pathSegments[0] == 'certificateInfo') {
        return NavigationStateCertificateInfo(certId: uri.pathSegments[1]);
      } else if (uri.pathSegments[0] == 'gift') {
        return NavigationStateAcceptGift(giftId: uri.pathSegments[1]);
      }
    }

    return const NavigationStateMain();
  }

  @override
  RouteInformation? restoreRouteInformation(NavigationState configuration) {
    if (configuration is NavigationStateMain) {
      return const RouteInformation(location: '/');
    } else if (configuration is NavigationStateMyCertificates) {
      return const RouteInformation(location: '/myCertificates');
    } else if (configuration is NavigationStateCertificateInfo) {
      NavigationStateCertificateInfo state = configuration;

      return RouteInformation(location: '/certificateInfo/${state.certId}');
    } else if (configuration is NavigationStateAcceptGift) {
      NavigationStateAcceptGift state = configuration;

      return RouteInformation(location: '/certificateInfo/${state.giftId}');
    }

    return const RouteInformation(location: '/');
  }
}
