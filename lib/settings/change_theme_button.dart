import 'package:flutter/material.dart';
import 'package:matchmaking_demo/utils/dark_theme_provider.dart';
import 'package:provider/provider.dart';

class ChangeThemeButton extends StatefulWidget {
  const ChangeThemeButton({Key? key}) : super(key: key);

  @override
  State<ChangeThemeButton> createState() => _ChangeThemeButtonState();
}

class _ChangeThemeButtonState extends State<ChangeThemeButton> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<DarkThemeProvider>(context);
    return Switch.adaptive(
        value: themeProvider.darkTheme,
        onChanged: (value) {
          // final provider =
          //     Provider.of<DarkThemeProvider>(context, listen: false);
        });
  }
}
