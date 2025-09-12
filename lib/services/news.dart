import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:newsnow/models/article_model.dart';

class News {
  List<ArticleModel> news = [];

  Future<List<ArticleModel>> getNews() async {
    final String response = await rootBundle.loadString('assets/config.json');
    final data = await json.decode(response);
    final apiKey = data['api_key'];

    String url = 'https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=$apiKey';
    var res= await http.get(Uri.parse(url));
    
    var jsonData= jsonDecode(res.body);

    if(jsonData["status"]=="ok"){
      jsonData["articles"].forEach((element){
        if(element["urlToImage"]!=null && element["description"]!=null){
          ArticleModel articleModel=ArticleModel(
            imageUrl: element["urlToImage"],
            description: element["description"],
            title: element["title"],
            url: element["url"]
          );
          news.add(articleModel);
        }
      });
    }
    return news;
  }
}
