import 'package:AlisNews/resources/news_repository.dart';
import 'package:bloc/bloc.dart';
import '../models/news_model.dart';

class MainBloc extends Cubit<List<NewsModel>> {
  MainBloc() : super([]);
  NewsRepository _newsRepository = new NewsRepository();
  
  fetchTopNews([category]) async {
    emit(await _newsRepository.fetchTopNews(category));
  }
}
