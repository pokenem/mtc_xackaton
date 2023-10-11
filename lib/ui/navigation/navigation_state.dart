import '../../model/certificate.dart';

class NavigationState {
  const NavigationState();
}

enum MainTab { money, service }

class NavigationStateMain extends NavigationState {
  final MainTab tab;

  const NavigationStateMain({required this.tab});
}

class NavigationStateList extends NavigationState {
  const NavigationStateList();
}

class NavigationStateCertificateInfo extends NavigationState {
  final String certificateId;

  const NavigationStateCertificateInfo({required this.certificateId});
}

class NavigationStateOrder extends NavigationState {
  final Certificate certificate;

  const NavigationStateOrder({required this.certificate});
}

class NavigationStateAcceptGift extends NavigationState {
  final String giftId;

  const NavigationStateAcceptGift({required this.giftId});
}