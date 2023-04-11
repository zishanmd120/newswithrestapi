import 'package:flutter/material.dart';
import 'package:newswithrestapi/Helper/categorynews.dart';
import 'package:newswithrestapi/Helper/widgets.dart';

class CategoryNews extends StatefulWidget {

  final String ? newsCategory;

  const CategoryNews({super.key, this.newsCategory});

  @override
  State<CategoryNews> createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  var newslist = [];
  bool _loading = true;

  @override
  void initState() {
    getNews();
    // TODO: implement initState
    super.initState();
  }

  void getNews() async {
    NewsForCategory news = NewsForCategory();
    await news.getNewsForCategory(widget.newsCategory.toString());
    newslist = news.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: _loading ? const Center(
          child: CircularProgressIndicator(),
        ) : SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 80,
                width: double.infinity,
                color: Colors.indigo,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text("Mocky", style: TextStyle(fontSize: 30, color: Colors.white),),
                    SizedBox(width: 5,),
                    Text("News", style: TextStyle(fontSize: 30, color: Colors.orangeAccent),),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 16),
                child: ListView.builder(
                    itemCount: newslist.length,
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return NewsTile(
                        imgUrl: newslist[index].urlToImage ?? "",
                        title: newslist[index].title ?? "",
                        desc: newslist[index].description ?? "",
                        content: newslist[index].content ?? "",
                        posturl: newslist[index].articleUrl ?? "",
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}