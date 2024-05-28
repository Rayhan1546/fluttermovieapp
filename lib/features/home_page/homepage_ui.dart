import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mymovieapp/common/Instance/home_page_viewmodel_instance.dart';
import 'package:mymovieapp/features/home_page/homepage_viewmodel.dart';
import 'package:mymovieapp/features/home_page/shimmer/homepage_shimmer.dart';
import 'package:mymovieapp/features/home_page/widgets/listview_builder.dart';
import 'package:mymovieapp/features/home_page/widgets/pageview_builder.dart';
import 'package:mymovieapp/features/see_all/see_all_ui.dart';

class HomePageUi extends StatelessWidget {
  HomePageUi({super.key});

  HomepageViewmodel viewmodel = HomePageViewmodelInstance.getInstance();

  @override
  Widget build(BuildContext context) {
    viewmodel.getAllMovies();
    return ValueListenableBuilder(
        valueListenable: viewmodel.movieList,
        builder: (context, movielist, _) {
          if(movielist == null) return HomepageShimmer();
          return Scaffold(
            body: SafeArea(
              child: Container(
                color: Colors.black,
                padding: EdgeInsets.fromLTRB(10.0, 10.0, 10, 0.0),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Welcome back,',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                ),
                              ),
                              Text(
                                'Rayhan Mahmud.',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Spacer(),
                          Icon(
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
                          Spacer(),
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
