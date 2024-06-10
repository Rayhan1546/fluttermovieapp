import 'package:flutter/material.dart';
import 'package:mymovieapp/features/home_page/homepage_viewmodel.dart';
import 'package:mymovieapp/features/home_page/shimmer/homepage_shimmer.dart';
import 'package:mymovieapp/features/home_page/widgets/listview_builder.dart';
import 'package:mymovieapp/features/home_page/widgets/pageview_builder.dart';
import 'package:mymovieapp/features/see_all/see_all_ui.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePageUi extends StatelessWidget {
  HomePageUi({super.key});

  HomepageViewmodel viewmodel = HomepageViewmodel.getInstance();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
        valueListenable: viewmodel.movies,
        builder: (context, movielist, _) {
          if (movielist == null) return const HomepageShimmer();
          return Scaffold(
            backgroundColor: Theme.of(context).colorScheme.surface,
            body: SafeArea(
              child: Container(
                padding: const EdgeInsets.fromLTRB(10.0, 10.0, 10, 0.0),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                AppLocalizations.of(context)!.welcome,
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                              Text(
                                AppLocalizations.of(context)!.name,
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Spacer(),
                          Icon(
                            Icons.check_box_outline_blank_rounded,
                            size: 40,
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      PageViewBuilder(),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Text(
                            AppLocalizations.of(context)!.top_movie,
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                          const Spacer(),
                          GestureDetector(
                            child: Text(
                              AppLocalizations.of(context)!.see_all,
                              style: TextStyle(
                                  fontSize: 12),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SeeAllUi(),
                                ),
                              );
                            },
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ListViewBuilder(),
                      Row(
                        children: [
                          Text(
                            AppLocalizations.of(context)!.upcoming_movie,
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                          const Spacer(),
                          GestureDetector(
                            child: Text(
                              AppLocalizations.of(context)!.see_all,
                              style: TextStyle(
                                  fontSize: 12),
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SeeAllUi(),
                                ),
                              );
                            },
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ListViewBuilder(),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
