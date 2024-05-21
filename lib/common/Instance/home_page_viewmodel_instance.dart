import 'package:mymovieapp/features/home_page/homepage_viewmodel.dart';

class HomePageViewmodelInstance {
  static HomepageViewmodel? homepageViewmodel;

  static HomepageViewmodel getInstance() {
    homepageViewmodel ??= HomepageViewmodel();
    return homepageViewmodel!;
  }
}
