import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
            const SizedBox(height: 125),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                'Change theme using Cubit+Stream. Find full source from below link. (Tap to copy)',
                style: Theme.of(context).textTheme.bodyText1,
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 5),
            GestureDetector(
              onTap: () {
                Clipboard.setData(const ClipboardData(
                        text:
                            "https://github.com/demo-Ashif/FlutterThemeSwitch"))
                    .then((_) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text('Link copied to your clipboard!')));
                });
              },
              child: Text(
                'https://github.com/demo-Ashif/FlutterThemeSwitch',
                style: Theme.of(context).textTheme.caption,
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<ThemeCubit>().switchTheme(),
        backgroundColor:
            context.read<ThemeCubit>().state.themeMode == ThemeMode.light
                ? Colors.black
                : Colors.amber,
        tooltip: 'Switch Theme',
        child: context.read<ThemeCubit>().state.themeMode == ThemeMode.light
            ? const Icon(Icons.dark_mode)
            : const Icon(Icons.light_mode),
      ),
    );
  }
}
