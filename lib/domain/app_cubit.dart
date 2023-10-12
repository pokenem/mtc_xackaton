import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtc_xackaton/model/certificate.dart';

import '../model/category.dart';
import '../model/service_group.dart';
import '../model/service.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(const AppStateLoading());

  Future<void> init() async {
    print('init');

    await Future.delayed(const Duration(seconds: 2));

    emit(
      const AppStateLoaded(
        categories: [
          Category(id: '1', name: 'ВСЕ', imageLink: 'xui'),
          Category(id: '2', name: 'ЧУРКИ', imageLink: 'xui'),
          Category(id: '3', name: 'БЕБРЫ', imageLink: 'xui'),
        ],
        services: [
          ServiceGroup(
            id: '1',
            name: '2',
            services: [
              Service(
                name: 'bim bim',
                description: 'bam bam',
                cost: 120,
                imageLink: 'hui',
              ),
            ],
          )
        ],
      ),
    );
  }

  Future<void> butCertificate(Certificate cert) async {
    print('buy');
  }
}
