import 'package:xrpl2_plazaku/datas/search_data.dart';
import 'package:xrpl2_plazaku/models/search_model.dart';

class SearchService {
  final List<SearchModel> searches = searchHistory;

  List<SearchModel> userSearchHistory(int userId) {
    return searches.where((element) => element.userId == userId).toList();
  }

  void addSearchToHistory(int userId, String search) {
    final isExist = searchHistory.any(
      (element) =>
          element.userId == userId &&
          element.search.toLowerCase() == search.toLowerCase(),
    );

    if (!isExist) {
      searches.add(
        SearchModel(
          id: DateTime.now().millisecondsSinceEpoch,
          userId: userId,
          search: search,
        ),
      );
    }
  }

  void removeSearchFromHistory(SearchModel search, int userId) {
    searches.removeWhere(
      (element) => element.userId == userId && element.id == search.id,
    );
  }
}
