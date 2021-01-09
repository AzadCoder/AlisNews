import 'package:AlisNews/resources/news_repository.dart';
import 'package:bloc/bloc.dart';
import '../models/news_model.dart';

enum StateOfNews {
  LOADING_MORE,
  NOT_SEARCHED,
  NOTHING_FOUND,
  LOADING,
  LOADED,
  FINISHED
}

NewsRepository _newsRepository = new NewsRepository();

class MainBloc extends Cubit<StateOfNews> {
  MainBloc() : super(StateOfNews.LOADING);
  int page = 1;
  List<NewsModel> newsList = [];
  fetchTopNews([category]) async {
    if (page == 6) {
      emit(StateOfNews.FINISHED);
    } else {
      emit(StateOfNews.LOADING);
      newsList.addAll(
        await _newsRepository.fetchTopNews(
          category,
          page,
        ),
      );
      emit(StateOfNews.LOADED);
      page += 1;
    }
  }

  fetchNewsByCategory(category) async {
    page = 1;
    emit(StateOfNews.LOADING);
    newsList = [];
    newsList = await _newsRepository.fetchTopNews(
      category,
      page,
    );
    emit(StateOfNews.LOADED);
  }
}

class SearchCubit extends Cubit<StateOfNews> {
  SearchCubit() : super(StateOfNews.NOT_SEARCHED);
  List<NewsModel> newsList = [];
  int page = 1;
  searchNews({String query, String language, String country}) async {
    emit(StateOfNews.LOADING);
    page = 1;
    newsList = [];
    newsList = await _newsRepository.searchNews(
      q: query,
      lang: language,
      country: country,
    );
    emit(StateOfNews.LOADED);
    if (newsList.isEmpty) {
      emit(StateOfNews.NOTHING_FOUND);
    }
  }

  loadMoreNews({String query, String language, String country}) async {
    page += 1;
    if (page == 6) {
      emit(StateOfNews.FINISHED);
    } else {
      emit(StateOfNews.LOADING_MORE);
      newsList.addAll(
        await _newsRepository.searchNews(
          q: query,
          lang: language,
          country: country,
          page: page,
        ),
      );
      emit(StateOfNews.LOADED);
    }
  }
}
