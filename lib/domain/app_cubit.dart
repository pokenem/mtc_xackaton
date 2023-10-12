import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mtc_xackaton/model/certificate.dart';

import '../data/api_provider.dart';
import '../model/category.dart';
import '../model/service_group.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  APIProvider _api = APIProvider();

  AppCubit() : super(const AppStateLoading());

  Future<void> init() async {
    print('init');

    List<Category> categories = await _api.getCategories();

    emit(
      AppStateLoaded(
        categories: categories,
        services: [
          ServiceGroup(
            id: '1',
            name: 'Бебебе',
            services: [
              CertificateService(
                name: 'bim bim',
                description: 'bam bam',
                cost: 120,
                imageLink: 'https://i.imgur.com/0WCT0md.png',
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
                imageLink: 'https://i.imgur.com/0WCT0md.png',
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
