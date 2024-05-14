import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mymovieapp/features/home_page/homepage_viewmodel.dart';

class HomePageUi extends StatelessWidget {
  HomePageUi({super.key});

  HomePageViewModel viewModel = HomePageViewModel();

  @override
  Widget build(BuildContext context) {
    viewModel.fetchPopularMovies();
    return Scaffold(
      body: Container(
        color: Colors.black87,
        padding: EdgeInsets.fromLTRB(20.0, 60.0, 20.0, 0.0),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
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
            SizedBox(height: 30,),
            ValueListenableBuilder<List?>(
              valueListenable: viewModel.popularMovies,
              builder: (context, popularMovies, _) {
                if (popularMovies == null) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return Container(
                    height: MediaQuery.of(context).size.height/4,
                    width: MediaQuery.of(context).size.width,
                    child: PageView.builder(
                      itemCount: popularMovies.length,
                      itemBuilder: (context, index) {
                        final movie = popularMovies[index];
                        return Image.network(movie["large_cover_image"],fit: BoxFit.fill,);
                      },
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
