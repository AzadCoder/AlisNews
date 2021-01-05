import 'news_api_provider.dart';
import '../models/news_model.dart';

class NewsRepository {
  final NewsApiProvider _weatherApiProvider = new NewsApiProvider();
  Future<List<NewsModel>> fetchTopNews([category]) {
    category == null ? category = "" : category = category;
    return _weatherApiProvider.getTopNews(category: category);
  }

  Future<List<NewsModel>> searchNews({q, lang = "us", country}) =>
      _weatherApiProvider.searchNews(q: q, lang: lang, country: country);
}
