import 'package:flutter/material.dart';
import 'package:mymovieapp/features/page_transitions/page_transition_ui.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mymovieapp/features/search_page/search_page_ui.dart';
import 'package:mymovieapp/main_viewmodel.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  MainViewmodel viewmodel = MainViewmodel.getInstance();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: viewmodel.language,
        builder: (context, language, _) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(
              primarySwatch: Colors.green,
            ),
            home: PageTransitionUi(),
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            locale: Locale.fromSubtags(
              languageCode: language.getLocal(),
            ),
          );
        });
  }
}
