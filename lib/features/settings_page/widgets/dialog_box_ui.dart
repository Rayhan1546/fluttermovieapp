import 'package:flutter/material.dart';
import 'package:mymovieapp/features/settings_page/widgets/enums.dart';
import 'package:mymovieapp/main_viewmodel.dart';

void DialogBoxUi(BuildContext context) {
  MainViewmodel mainViewmodel = MainViewmodel.getInstance();

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return ValueListenableBuilder(
          valueListenable: mainViewmodel.language,
          builder: (context, value, _) {
            return AlertDialog(
              backgroundColor: Colors.grey[900],
              title: Text(
                'Select Language',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w600),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: Language.values
                    .map((e) => _languageButton(
                          context,
                          e,
                          value == e,
                          () {
                            mainViewmodel.onClickSetLanguage(e);
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

Widget _languageButton(BuildContext context, Language language, bool isSelceted,
    VoidCallback onTap) {
  return ListTile(
    title: Text(language.name, style: TextStyle(color: Colors.white)),
    trailing: isSelceted ? Icon(Icons.check, color: Colors.white) : null,
    onTap: onTap,
  );
}
