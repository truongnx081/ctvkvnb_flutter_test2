import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_4/data/constants.dart';
import 'package:test_4/data/notifiers.dart';
import 'package:test_4/views/pages/home_page.dart';
import 'package:test_4/views/pages/profile_page.dart';
import 'package:test_4/views/pages/settings_page.dart';
import '../widgets/navbar_widget.dart';

List<Widget>pages=[
  HomePage(),
  ProfilePage()
];

class WidgetTree extends StatefulWidget {
  const WidgetTree({super.key});

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("FLutter App"),
        actions: [
          IconButton(
            onPressed: () async {
              SharedPreferences.setMockInitialValues({});
              final SharedPreferences prefs = await SharedPreferences.getInstance();
              print("Trước khi thay đổi: ${isDarkModeNotifier.value}");
              isDarkModeNotifier.value = !isDarkModeNotifier.value;
              await prefs.setBool(KConstants.themeModeKey, isDarkModeNotifier.value);
              print("Sau khi thay đổi: ${isDarkModeNotifier.value}");
            },

            icon: ValueListenableBuilder(
                  valueListenable: isDarkModeNotifier,
                  builder: (context, isDarkMode, child) {
                    return Icon(
                        isDarkMode ? Icons.dark_mode : Icons.light_mode
                    );
                  },
              ),
          ),
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return SettingsPage(title: 'Settings');
                    },
                    ),
                );
              },
              icon: Icon(Icons.settings)
          )
        ],
      ),
      body: ValueListenableBuilder(
          valueListenable: selectedPageNotifier,
          builder: (context, selectedPage, child) {
            return pages.elementAt(selectedPage);
          },
      ),
      bottomNavigationBar:NavbarWidget(),
    );
  }
}
