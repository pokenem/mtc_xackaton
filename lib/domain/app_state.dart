part of 'app_cubit.dart';

class AppState {
  const AppState();
}

class AppStateLoading extends AppState {
  const AppStateLoading();
}

class AppStateMainPage extends AppState {
  const AppStateMainPage();
}

class AppStateOrderPage extends AppState {
  final Certificate cert;

  const AppStateOrderPage({required this.cert});
}

class AppStateMyCertificatesPage extends AppState {
  const AppStateMyCertificatesPage();
}

class AppStateCertificateInfoPage extends AppState {
  const AppStateCertificateInfoPage();
}
