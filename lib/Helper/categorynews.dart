import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:newswithrestapi/Model/secondmodel.dart';

class NewsForCategory {

  List<Article> news  = [];

  Future<void> getNewsForCategory(String category) async{

    final url = Uri.parse("http://newsapi.org/v2/top-headlines?country=gb&category=$category&apiKey=42e295e812004ca3bee8354327da05d5");

    var response = await http.get(url);

    var jsonData = jsonDecode(response.body);

    if(jsonData['status'] == "ok"){
      jsonData["articles"].forEach((element){

        if(element['urlToImage'] != null && element['description'] != null){
          Article article = Article(
            title: element['title'],
            author: element['author'],
            description: element['description'],
            urlToImage: element['urlToImage'],
            publishedAt: DateTime.parse(element['publishedAt']),
            content: element["content"],
            articleUrl: element["url"],
          );
          news.add(article);
        }

      });
    }


  }


}