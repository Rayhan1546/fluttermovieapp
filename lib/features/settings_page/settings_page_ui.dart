import 'package:flutter/material.dart';
import 'package:mymovieapp/features/settings_page/widgets/dialog_box_ui.dart';
import 'package:mymovieapp/features/settings_page/widgets/enums.dart';
import 'package:mymovieapp/main_viewmodel.dart';

class SettingsPageUi extends StatelessWidget {
  SettingsPageUi({super.key});

  MainViewmodel mainViewmodel = MainViewmodel.getInstance();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.fromLTRB(20, 30, 20, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Settings',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 35,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'General',
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                generalSettingUi(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget generalSettingUi(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: mainViewmodel.language,
        builder: (context, language, _) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                onTap: () {},
                title: Text('Name',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w800)),
                subtitle: Text(
                  'Rayhan Mahmud',
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.w300),
                ),
                trailing: Icon(
                  Icons.navigate_next_outlined,
                  color: Colors.white,
                ),
              ),
              ListTile(
                title: Text('Language',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w800)),
                subtitle: Text(
                  language.getLanguageName(),
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.w300),
                ),
                trailing: Icon(
                  Icons.navigate_next_outlined,
                  color: Colors.white,
                ),
                onTap: () {
                  DialogBoxUi(context);
                },
              ),
              ListTile(
                title: Text('Theme',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.w800)),
                subtitle: Text(
                  'Dark',
                  style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.w300),
                ),
                trailing: Icon(
                  Icons.navigate_next_outlined,
                  color: Colors.white,
                ),
                onTap: () {},
              ),
            ],
          );
        });
  }
}
