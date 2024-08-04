import 'package:bloc/bloc.dart';
import 'package:news_app/apis/api_manager.dart';
import 'package:news_app/category_details/news_cubit/states.dart';

class NewsWidgetViewModel extends Cubit<NewsStates> {
  NewsWidgetViewModel() : super(NewsInitialState());
  // Hold Data - Handle Logic
  void getNews({required sourceId}) async {
    try {
      // First Loading State
      emit(NewsLoadingState());
      var response = await ApiManager.getNewsBySourceId(sourceId);
      // Handle Error State
      if (response!.status == 'error') {
        emit(NewsErrorState(errorMessage: response.message));
        return;
      }
      // Handle Success State
      if (response.status == 'ok') {
        emit(NewsSuccessState(news: response.articles!));
        return;
      }
    } catch (e) {
      // Handle Error State
      emit(NewsErrorState(errorMessage: e.toString()));
    }
  }
}
