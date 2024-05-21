import 'package:mymovieapp/features/watch_list/watch_list_viewmodel.dart';

class WatchListViewmodelInstance {
  static WatchListViewmodel? watchListViewmodel;

  static WatchListViewmodel getInstance() {
    watchListViewmodel ??= WatchListViewmodel();

    return watchListViewmodel!;
  }
}
