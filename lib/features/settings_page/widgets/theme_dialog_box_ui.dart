import 'package:flutter/material.dart';
import 'package:mymovieapp/common/enums/themes.dart';
import 'package:mymovieapp/main_viewmodel.dart';

void ThemeDialoagBoxUi(BuildContext context) {
  MainViewmodel mainViewmodel = MainViewmodel.getInstance();

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return ValueListenableBuilder(
          valueListenable: mainViewmodel.theme,
          builder: (context, value, _) {
            return AlertDialog(
              backgroundColor: Colors.grey[900],
              title: Text(
                'Select Theme',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: Themes.values
                    .map((e) => _themeButton(
                          context,
                          e,
                          value == e,
                          () {
                            mainViewmodel.onClickSetTheme(e);
                            Navigator.pop(context);
                          },
                        ))
                    .toList(),
              ),
            );
          });
    },
  );
}

Widget _themeButton(
    BuildContext context, Themes theme, bool isSelceted, VoidCallback onTap) {
  return ListTile(
    title: Text(theme.name, style: TextStyle(color: Colors.white)),
    trailing: isSelceted ? Icon(Icons.check, color: Colors.white) : null,
    onTap: onTap,
  );
}
