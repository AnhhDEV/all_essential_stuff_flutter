import 'package:flutter/material.dart';
import 'package:helloworld/data/constants.dart';
import 'package:helloworld/data/notifiers.dart';
import 'package:helloworld/view/pages/home_page.dart';
import 'package:helloworld/view/pages/profile_page.dart';
import 'package:helloworld/view/pages/setting_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'widgets/narbar_widget.dart';

List<Widget> pages = [HomePage(), ProfilePage()];

class WidgetTree extends StatelessWidget {
  const WidgetTree({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Initial Flutter App'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () async {
              isDarkModeNotifier.value = !isDarkModeNotifier.value;
              final SharedPreferences prefs =
                  await SharedPreferences.getInstance();
              await prefs.setBool(
                KConstants.isDarkKey,
                isDarkModeNotifier.value,
              );

            },
            icon: ValueListenableBuilder(
              valueListenable: isDarkModeNotifier,
              builder: (context, isDarkMode, child) {
                IconData icon = isDarkMode ? Icons.dark_mode : Icons.light_mode;
                return Icon(icon);
              },
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SettingPage(title: 'Setting');
                  },
                ),
              );
            },
            icon: Icon(Icons.settings),
          ),
        ],
      ),
      body: ValueListenableBuilder(
        valueListenable: selectedPageNotifier,
        builder: (context, value, child) {
          return pages.elementAt(selectedPageNotifier.value);
        },
      ),
      bottomNavigationBar: NavbarWidget(),
    );
  }
}
