import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:newsnow/models/show_category_model.dart';

class ShowCategoryNews{
  List<ShowCategoryModel> categoryList=[];

  Future<List<ShowCategoryModel>> getCategory(String category)async{
    final String response = await rootBundle.loadString('assets/config.json');
    final data = await json.decode(response);
    final apiKey = data['api_key'];
    String url = "https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=$apiKey";
    var res= await http.get(Uri.parse(url));
    var jsonDate= jsonDecode(res.body);

    if(jsonDate['status']=="ok"){
      jsonDate["articles"].forEach((element){
        if(element["urlToImage"]!=null && element["description"]!=null){
          ShowCategoryModel showCategoryModel=ShowCategoryModel(
              imageUrl: element["urlToImage"],
              description: element["description"],
              title: element["title"],
              url: element["url"]
          );
          categoryList.add(showCategoryModel);
        }
      }
      );
    }
    return categoryList;
  }

  Future<List<ShowCategoryModel>> getTrendingNews() async {
    final String response = await rootBundle.loadString('assets/config.json');
    final data = await json.decode(response);
    final apiKey = data['api_key'];
    String url = "https://newsapi.org/v2/top-headlines?country=us&apiKey=$apiKey";
    var res = await http.get(Uri.parse(url));
    var jsonDate = jsonDecode(res.body);

    if (jsonDate['status'] == "ok") {
      jsonDate["articles"].forEach((element) {
        if (element["urlToImage"] != null && element["description"] != null) {
          ShowCategoryModel showCategoryModel = ShowCategoryModel(
            imageUrl: element["urlToImage"],
            description: element["description"],
            title: element["title"],
            url: element["url"],
          );
          categoryList.add(showCategoryModel);
        }
      });
    }
    return categoryList;
  }
}