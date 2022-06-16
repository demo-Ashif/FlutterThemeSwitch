import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'app_theme.dart';
import 'home_page.dart';
import 'theme_cubit/theme_cubit.dart';
import 'theme_repository.dart';

class App extends StatelessWidget {
  const App({
    Key? key,
    required this.themeRepository,
  }) : super(key: key);

  final ThemeRepository themeRepository;

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider.value(
      value: themeRepository,
      child: BlocProvider(
        create: (context) => ThemeCubit(
          themeRepository: context.read<ThemeRepository>(),
        )..getCurrentTheme(),
        child: const AppView(),
      ),
    );
  }
}

class AppView extends StatelessWidget {
  const AppView({Key? key}) : super(key: key);

  // const AppView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeState>(
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.darkTheme,
          themeMode: state.themeMode,
          home: HomePage(),
        );
      },
    );
  }
}
