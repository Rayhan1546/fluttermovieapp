import 'package:flutter/material.dart';
import 'package:mymovieapp/common/Instance/home_page_viewmodel_instance.dart';
import 'package:mymovieapp/features/home_page/homepage_viewmodel.dart';


class PageViewBuilder extends StatelessWidget {
  PageViewBuilder({super.key});

  HomepageViewmodel viewmodel = HomePageViewmodelInstance.getInstance();


  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: HomepageViewmodel.movieList,
      builder: (context, movielist, _) {
        if (movielist == null) {
          return Center(child: CircularProgressIndicator());
        } else {
          return Container(
            height: MediaQuery.of(context).size.height / 4,
            width: MediaQuery.of(context).size.width,
            child: PageView.builder(
              itemCount: movielist.length,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: NetworkImage(movielist[index].backgroundImageOriginal!),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Container(
                    height: 100,
                    width: 100,
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }
}
