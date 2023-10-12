import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtc_xackaton/model/certificate.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(const AppStateLoading());

  Future<void> init() async {
    print('init');

    await Future.delayed(const Duration(seconds: 2));

    emit(const AppStateMainPage());
  }

  Future<void> butCertificate(Certificate cert) async {
    print('buy');
  }
}