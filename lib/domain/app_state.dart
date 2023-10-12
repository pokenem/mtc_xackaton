part of 'app_cubit.dart';

class AppState {
  const AppState();
}

class AppStateLoading extends AppState {
  const AppStateLoading();
}

class AppStateLoaded extends AppState {
  final List<Category> categories;
  final List<ServiceGroup> services;

  const AppStateLoaded({required this.categories, required this.services});
}
