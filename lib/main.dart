import 'package:flutter/material.dart';
import 'package:helloworld/data/constants.dart';
import 'package:helloworld/data/notifiers.dart';
import 'package:helloworld/view/pages/welcome_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

//MaterialApp (stateful)
//scaffold
//app title
//bottom navigation bar setstatee

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  void initState() {
    initThemeMode();
    super.initState();
  }

  Future<void> initThemeMode() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool? isDarkMode = prefs.getBool(KConstants.isDarkKey);
    isDarkModeNotifier.value = isDarkMode ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: isDarkModeNotifier, builder: (context, isDark, child) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.teal,
            brightness: isDark ? Brightness.dark : Brightness.light,
          ),
        ),
        home: WelcomePage(),
      );
    });
  }
}
