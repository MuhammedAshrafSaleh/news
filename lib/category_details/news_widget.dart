import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/apis/api_manager.dart';
import 'package:news_app/category_details/news_cubit/states.dart';
import 'package:news_app/category_details/news_item.dart';
import 'package:news_app/theme/mytheme.dart';

import '../models/source_model.dart';
import 'news_cubit/news_widget_view_model.dart';

// ignore: must_be_immutable
class NewsWidget extends StatefulWidget {
  Source source;
  NewsWidget({super.key, required this.source});

  @override
  State<NewsWidget> createState() => _NewsWidgetState();
}

class _NewsWidgetState extends State<NewsWidget> {
  NewsWidgetViewModel viewModel = NewsWidgetViewModel();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder(
        bloc: viewModel,
        builder: (context, state) {
          if (state is NewsLoadingState) {
            return const Center(
              child: CircularProgressIndicator(
                color: MyTheme.primaryColor,
              ),
            );
          }
          if (state is NewsErrorState) {
            return Center(
              child: Column(
                children: [
                  const Text('Something Went Wrong!'),
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          ApiManager.getNewsBySourceId(widget.source.id ?? '');
                        });
                      },
                      child: const Text('Try Again!'))
                ],
              ),
            );
          }
          if (state is NewsSuccessState) {
            return ListView.builder(
                itemCount: state.news.length,
                itemBuilder: (context, index) {
                  return NewsItem(news: state.news[index]);
                });
          }
          return Container();
        });
    // return  FutureBuilder<NewsResponse?>(
    //     future: ApiManager.getNewsBySourceId(widget.source.id ?? ''),
    //     builder: (context, snapshot) {
    //       // Case 1: Loading
    //       if (snapshot.connectionState == ConnectionState.waiting) {
    //         return const Center(
    //           child: CircularProgressIndicator(
    //             color: MyTheme.primaryColor,
    //           ),
    //         );
    //       }
    //       // Case 2: User Error
    //       else if (snapshot.hasError) {
    //         return Column(
    //           children: [
    //             const Text('Something Went Wrong!'),
    //             ElevatedButton(
    //                 onPressed: () {
    //                   setState(() {
    //                     ApiManager.getNewsBySourceId(widget.source.id ?? '');
    //                   });
    //                 },
    //                 child: const Text('Try Again!'))
    //           ],
    //         );
    //       }
    //       // Case 3: Server Case
    //       else {
    //         // Case 2: Error Case
    //         if (snapshot.data?.status! != 'ok') {
    //           // Case 3: Server Error Status
    //           return Column(children: [
    //             Text(snapshot.data?.message ??
    //                 "Server Error, Please try later."),
    //             ElevatedButton(
    //                 onPressed: () {
    //                   setState(() {
    //                     ApiManager.getNewsBySourceId(widget.source.id ?? '');
    //                   });
    //                 },
    //                 child: const Text('Try Again!'))
    //           ]);
    //         }
    //         // Case 1: Success Case
    //         else {
    //           var news = snapshot.data?.articles ?? [];
    //           print(news);
    //           return ListView.builder(
    //               itemCount: news.length,
    //               // scrollDirection: Axis.vertical,
    //               itemBuilder: (context, index) {
    //                 return NewsItem(news: news[index]);
    //               });
    //         }
    //       }
    //     });
  }
}
