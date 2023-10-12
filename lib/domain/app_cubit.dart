import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtc_xackaton/model/certificate.dart';

import '../model/category.dart';
import '../model/service_group.dart';

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
            name: 'Бебебе',
            services: [
              CertificateService(
                name: 'bim bim',
                description: 'bam bam',
                cost: 120,
                imageLink: 'hui',
                serviceName: '',
                serviceId: '1',
              ),
            ],
          ),
          ServiceGroup(
            id: '2',
            name: 'Бабаба',
            services: [
              CertificateService(
                name: 'bam bam',
                description: 'bam bam',
                cost: 120,
                imageLink: 'hui',
                serviceName: '',
                serviceId: '2',
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
