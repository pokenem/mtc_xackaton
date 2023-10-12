import '../../model/certificate.dart';
import '../../model/service_group.dart';

class NavigationState {
  const NavigationState();
}

class NavigationStateLoading extends NavigationState {
  const NavigationStateLoading();
}

class NavigationStateMain extends NavigationState {
  const NavigationStateMain();
}

class NavigationStateMyCertificates extends NavigationState {
  const NavigationStateMyCertificates();
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