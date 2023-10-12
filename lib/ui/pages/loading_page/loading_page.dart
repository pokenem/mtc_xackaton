import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:mtc_xackaton/domain/app_cubit.dart';
import 'package:mtc_xackaton/ui/navigation/navigation_manager.dart';

class LoadingPage extends StatelessWidget {
  const LoadingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        if (state is AppStateLoaded) {
          GetIt.I.get<NavMan>().openMainPage();
        }
      },
      builder: (context, state) {
        return const Scaffold(
          body: Center(
            child: CircularProgressIndicator(
              color: Color(0xFFE30611),
            ),
          ),
        );
      },
    );
  }
}
