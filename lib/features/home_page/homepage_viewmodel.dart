import 'package:mymovieapp/data/repository/apicall_function.dart';

class HomePageViewModel {
  void fetchData(){
    ApiCallFunction.fetchPopularMovies();
  }
}
