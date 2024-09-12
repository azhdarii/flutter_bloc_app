import 'package:crypto1/providers/currentTheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Themeswitcher extends StatelessWidget {
  const Themeswitcher({super.key});

  @override
  Widget build(BuildContext context) {
    var themeProvider = Provider.of<ThemeProvider>(context);
    var myIcon = (themeProvider.isDark)
        ? Icon(CupertinoIcons.sun_max_fill)
        : Icon(CupertinoIcons.moon_fill);

    return IconButton(onPressed: () {
      themeProvider.toggle();

    }, icon: myIcon);
  }
}
