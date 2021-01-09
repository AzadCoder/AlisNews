import 'news_api_provider.dart';
import '../models/news_model.dart';

class NewsRepository {
  final NewsApiProvider _weatherApiProvider = new NewsApiProvider();
  Future<List<NewsModel>> fetchTopNews(category, page) {
    category == null ? category = "" : category = category;
    return _weatherApiProvider.getTopNews(category: category, page: page);
  }

  Future<List<NewsModel>> searchNews({q, lang = "us", country, page}) =>
      _weatherApiProvider.searchNews(
        q: q,
        lang: lang,
        country: country,
        page: page,
      );
}
