import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:mymovieapp/features/page_transitions/page_transition_ui.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:mymovieapp/main_viewmodel.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

import 'data/hive_database/movie.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final appDocumentDirectory = await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);

  Hive.registerAdapter(MovieAdapter());

  await Hive.openBox<Movie>('moviesBox');
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
