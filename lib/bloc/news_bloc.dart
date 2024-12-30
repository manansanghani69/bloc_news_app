import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/models/article_model.dart';
import '../data/repositories/article_repository.dart';
import 'news_event.dart';
import 'news_state.dart';

class NewsBloc extends Bloc<NewsEvents, NewsStates> {
  final ArticleRepository articleRepository;

  NewsBloc({required NewsStates initialState, required this.articleRepository})
      : super(initialState) {
    // Register the event handler for StartEvent
    on<StartEvent>((event, emit) async {
      try {
        emit(NewsLoadingState());
        List<ArticleModel> articleList = await articleRepository.fetchNews();
        emit(NewsLoadedState(articleList: articleList));
      } catch (e) {
        emit(NewsErrorState(errorMessage: e.toString()));
      }
    });
    // Add the StartEvent after registering the handler
    add(StartEvent());
  }
}
