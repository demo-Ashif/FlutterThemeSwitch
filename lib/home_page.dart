import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theme_switch_cubits/asset_locator.dart';

import 'theme_cubit/theme_cubit.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  //const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              context.read<ThemeCubit>().state.themeMode == ThemeMode.dark
                  ? AssetsLocator.imgNight
                  : AssetsLocator.imgDay,
            ),
            Text(
              'Follow me on my socials',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            const SizedBox(height: 10),
            Text(
              'https://github.com/demo-Ashif',
              style: Theme.of(context).textTheme.caption,
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<ThemeCubit>().switchTheme(),
        backgroundColor: Colors.red,
        tooltip: 'Switch Theme',
        child: context.read<ThemeCubit>().state.themeMode == ThemeMode.light
            ? const Icon(Icons.dark_mode)
            : const Icon(Icons.light_mode),
      ),
    );
  }
}
