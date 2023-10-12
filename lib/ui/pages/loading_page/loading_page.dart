import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:gif/gif.dart';
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
        } else if (state is AppStateError) {
          GetIt.I.get<NavMan>().openErrorPage(state.error);
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: Center(
            child: Gif(
              autostart: Autostart.loop,
              image: const AssetImage('assets/gif.gif'),
              width: 115,
            ),
          ),
        );
      },
    );
  }
}
