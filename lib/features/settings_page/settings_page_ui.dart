import 'package:flutter/material.dart';
import 'package:mymovieapp/common/widgets/elevated_btn.dart';
import 'package:mymovieapp/features/login/login_ui.dart';
import 'package:mymovieapp/features/settings_page/widgets/language_dialog_box_ui.dart';
import 'package:mymovieapp/features/settings_page/widgets/theme_dialog_box_ui.dart';
import 'package:mymovieapp/main_viewmodel.dart';

class SettingsPageUi extends StatelessWidget {
  SettingsPageUi({super.key});

  MainViewmodel mainViewmodel = MainViewmodel.getInstance();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.fromLTRB(20, 30, 20, 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Settings',
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'General',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 5,
                ),
                generalSettingUi(context),
                const SizedBox(
                  height: 220,
                ),
                logoutBtnUi(context),
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
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800)),
              subtitle: Text(
                'Rayhan Mahmud',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
              ),
              trailing: Icon(
                Icons.navigate_next_outlined,
              ),
            ),
            ListTile(
              title: Text('Language',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w800)),
              subtitle: Text(
                language.getLanguageName(),
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
              ),
              trailing: Icon(
                Icons.navigate_next_outlined,
              ),
              onTap: () {
                LanguageDialoagBoxUi(context);
              },
            ),
            ValueListenableBuilder(
              valueListenable: mainViewmodel.theme,
              builder: (context, theme, _) {
                return ListTile(
                  title: Text('Theme',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w800)),
                  subtitle: Text(
                    theme.getThemeName(),
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300),
                  ),
                  trailing: Icon(
                    Icons.navigate_next_outlined,
                  ),
                  onTap: () {
                    ThemeDialoagBoxUi(context);
                  },
                );
              },
            ),
          ],
        );
      },
    );
  }

  Widget logoutBtnUi(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: 60,
      child: ElevatedBtn(
          buttonText: 'Sign Out',
          backgroundColor: Colors.indigoAccent,
          onPressed: () {
            mainViewmodel.logoutUser();
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => LoginUi()));
          },
          textcolor: Colors.black),
    );
  }
}
