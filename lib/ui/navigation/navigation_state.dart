import '../../model/certificate.dart';

class NavigationState {
  const NavigationState();
}

class NavigationStateLoading extends NavigationState {
  const NavigationStateLoading();
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
  final String certId;

  const NavigationStateCertificateInfo({required this.certId});
}

class NavigationStateOrder extends NavigationState {
  final Certificate cert;

  const NavigationStateOrder({required this.cert});
}

class NavigationStateAcceptGift extends NavigationState {
  final String giftId;

  const NavigationStateAcceptGift({required this.giftId});
}