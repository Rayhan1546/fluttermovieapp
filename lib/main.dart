import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:mymovieapp/data/local/user_pref.dart';
import 'package:mymovieapp/data/models/user_model.dart';
import 'package:mymovieapp/features/login/login_ui.dart';
import 'package:mymovieapp/features/page_transitions/page_transition_ui.dart';
import 'package:mymovieapp/main_viewmodel.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'data/hive_database/hive_movie_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  final appDocumentDirectory =
      await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);

  Hive.registerAdapter(MovieAdapter());

  await Hive.openBox<HiveMovieModel>('moviesBox');

  UserModel? user = await UserPref.loadUserFromSharedPreferences();

  runApp(MyApp(user: user));
}

class MyApp extends StatelessWidget {
  final UserModel? user;

  MyApp({required this.user});

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
                home: user == null ? LoginUi() : PageTransitionUi(),
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
