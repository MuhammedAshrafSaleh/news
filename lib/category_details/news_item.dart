import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/news_response_model.dart';

class NewsItem extends StatelessWidget {
  News news;
  NewsItem({super.key, required this.news});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10,vertical: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 10),
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              // image: DecorationImage(image: NetworkImage(news.urlToImage ?? ''))
            ),
            child: CachedNetworkImage(
              imageUrl: news.urlToImage ?? '',
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  CircularProgressIndicator(value: downloadProgress.progress),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
          ),
          Text(news.author ?? '', style: Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.grey),)
        ],
      ),
    );
  }
}
