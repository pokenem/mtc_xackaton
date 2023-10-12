import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:mtc_xackaton/model/certificate.dart';

import '../data/api_provider.dart';
import '../model/category.dart';
import '../model/service_group.dart';

part 'app_state.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(const AppStateLoading());

  Future<void> init() async {
    try {
      List<Category> categories =
          await GetIt.I.get<APIProvider>().getCategories();

      List<ServiceGroup> services =
          await GetIt.I.get<APIProvider>().getServices();

      emit(
        AppStateLoaded(
          categories: categories,
          services: services,
        ),
      );
    } on DioException catch (e) {
      print('Error');
      print('Return code: ${e.response?.statusCode}');

      emit(const AppStateError(error: 'Не удалось загрузить данные'));
    } catch (e) {
      print('Error');

      emit(const AppStateError(error: 'Что-то пошло не так'));
      rethrow;
    }
  }

  Future<void> butCertificate(Certificate cert) async {
    print('buy');
  }
}
