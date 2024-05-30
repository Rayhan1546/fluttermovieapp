import 'package:flutter/material.dart';
import 'package:mymovieapp/common/Instance/home_page_viewmodel_instance.dart';
import 'package:mymovieapp/features/home_page/homepage_viewmodel.dart';
import 'package:mymovieapp/features/home_page/shimmer/homepage_shimmer.dart';
import 'package:mymovieapp/features/home_page/widgets/listview_builder.dart';
import 'package:mymovieapp/features/home_page/widgets/pageview_builder.dart';
import 'package:mymovieapp/features/see_all/see_all_ui.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HomePageUi extends StatelessWidget {
  HomePageUi({super.key});

  HomepageViewmodel viewmodel = HomePageViewmodelInstance.getInstance();

  @override
  Widget build(BuildContext context) {
    viewmodel.getAllMovies();
    return ValueListenableBuilder(
        valueListenable: viewmodel.movieList,
        builder: (context, movielist, _) {
          if(movielist == null) return const HomepageShimmer();
          return Scaffold(
            body: SafeArea(
              child: Container(
                color: Colors.black,
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
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              ),
                              const Text(
                                'Rayhan Mahmud.',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Spacer(),
                          const Icon(
                            Icons.check_box_outline_blank_rounded,
                            size: 40,
                            color: Colors.white,
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
                          const Text(
                            "Top Movie Picks",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                          const Spacer(),
                          GestureDetector(
                            child: const Text(
                              "See All",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
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
                          const Text(
                            "Upcoming Movies",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                          const Spacer(),
                          GestureDetector(
                            child: const Text(
                              "See All",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 12),
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
