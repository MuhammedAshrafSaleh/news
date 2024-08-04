import '../../models/news_response_model.dart';

abstract class NewsStates {}

class NewsInitialState extends NewsStates {}

class NewsLoadingState extends NewsStates {}

class NewsErrorState extends NewsStates {
  String? errorMessage;
  NewsErrorState({required this.errorMessage});
}

class NewsSuccessState extends NewsStates {
  List<News> news;
  NewsSuccessState({required this.news});
}
