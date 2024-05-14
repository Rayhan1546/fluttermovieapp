import 'package:flutter/material.dart';
import 'homepage_viewmodel.dart'; // Import your view model

class FutureBuilder extends StatelessWidget {
  final viewModel = HomePageViewModel(); // Instantiate your view model

  @override
  Widget build(BuildContext context) {
    viewModel.fetchPopularMovies();
    return MaterialApp(
      title: 'Popular Movies',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Popular Movies'),
        ),
        body: ValueListenableBuilder<List?>(
          valueListenable: viewModel.popularMovies,
          builder: (context, popularMovies, _) {
            if (popularMovies == null) {
              return Center(child: CircularProgressIndicator());
            } else {
              return ListView.builder(
                itemCount: popularMovies.length,
                itemBuilder: (context, index) {
                  final movie = popularMovies[index];
                  return ListTile(
                    leading: Image.network(movie["large_cover_image"]),
                    title: Text(movie["title"]),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
