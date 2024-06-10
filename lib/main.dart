import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:mymovieapp/features/page_transitions/page_transition_ui.dart';
import 'package:mymovieapp/features/search_page/search_page_ui.dart';
import 'package:mymovieapp/features/watch_list/watch_list_ui.dart';
import 'package:mymovieapp/main_viewmodel.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'data/hive_database/hive_movie_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final appDocumentDirectory =
      await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);

  Hive.registerAdapter(MovieAdapter());

  await Hive.openBox<HiveMovieModel>('moviesBox');
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
        return ValueListenableBuilder(
            valueListenable: viewmodel.theme,
            builder: (context, theme, _) {
              return MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Flutter Demo',
                home: PageTransitionUi(),
                theme: theme.getTheme(),
                localizationsDelegates: AppLocalizations.localizationsDelegates,
                supportedLocales: AppLocalizations.supportedLocales,
                locale: Locale.fromSubtags(
                  languageCode: language.getLocal(),
                ),
              );
            });
      },
    );
  }
}
