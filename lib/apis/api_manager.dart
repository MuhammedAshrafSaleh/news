import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app/apis/api_constants.dart';
import 'package:news_app/models/source_model.dart';

import '../models/news_response_model.dart';

class ApiManager {
  // https://newsapi.org/v2/top-headlines/sources?apiKey=a7f5f78045be4d30b9a0e027fece7f69
  static Future<SourceResponse?> getResources() async {
    Uri url = Uri.https(APIConstants.baseURL, APIConstants.sourcesEndPoint,
        {'apiKey': APIConstants.apiKey});
    //   (new) Uri Uri.https(
    //   String authority, [
    //   String unencodedPath,
    //   Map<String, dynamic>? queryParameters,
    // ])
    try {
      var response = await http.get(url);
      var json = jsonDecode(response.body); // Convert String TO JSON
      SourceResponse source =
          SourceResponse.fromJson(json); // Convert Json To Our Object
      return source;
      // response.body -> this is string to convert it to Json Then convert It To Object
    } catch (e) {
       throw e;
    }
  }

  // https://newsapi.org/v2/everything?q=bitcoin&apiKy=a7f5f78045be4d30b9a0e027fece7f69
  static Future<NewsResponse?> getNewsBySourceId(String sourceId) async {
    Uri url = Uri.https(APIConstants.baseURL, APIConstants.everythingEndPoint,
        {'apiKey': APIConstants.apiKey, 'sources': sourceId});
    try {
      var response = await http.get(url);
      print(response.body);
      var json = jsonDecode(response.body);
      NewsResponse newsResponse = NewsResponse.fromJson(json);
      return newsResponse;
    } catch (e) {
     throw e;
    }
  }
}
