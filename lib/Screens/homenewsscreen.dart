import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:newswithrestapi/Helper/categorylist.dart';
import 'package:newswithrestapi/Model/firstmodel.dart';
import 'package:newswithrestapi/Model/secondmodel.dart';
import 'package:newswithrestapi/Screens/categorynewsscreen.dart';
import 'package:http/http.dart' as http;
import 'package:newswithrestapi/Screens/detailnewsscreen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<CategoryModel> categories = <CategoryModel>[];
  static final List<NewsModel> _news = <NewsModel>[];
  static List<NewsModel> _newsInApp = <NewsModel>[];

  Future<List<NewsModel>> comingNews() async {
    var url = Uri.parse('http://www.mocky.io/v2/5ecfddf13200006600e3d6d0');
    var response = await http.get(url);
    var news = <NewsModel>[];
    if (response.statusCode == 200) {
      var notesJson = json.decode(response.body);
      for (var noteJson in notesJson) {
        news.add(NewsModel.fromJson(noteJson));
      }
    }
    return news;
  }

  @override
  void initState() {
    super.initState();
    categories = getCategories();
    comingNews().then((value) {
      setState(() {
        _news.addAll(value);
        _newsInApp = _news;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                height: 80,
                width: double.infinity,
                color: Colors.indigo,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "Mocky",
                      style:
                      TextStyle(fontSize: 30, color: Colors.white),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      "News",
                      style: TextStyle(
                          fontSize: 30, color: Colors.orangeAccent),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.menu,
                      size: 40,
                    ),
                  ),
                  Container(
                    height: 50,
                    width: MediaQuery.of(context).size.width - 120,
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.black)),
                    child: const Align(
                      alignment: Alignment.centerRight,
                      child: Icon(Icons.search),
                    ),
                  ),
                  const Icon(
                    Icons.notifications,
                    size: 40,
                  ),
                ],
              ),
              Container(
                margin: const EdgeInsets.only(top: 20),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                height: 70,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      return CategoryCard(
                        imageAssetUrl: categories[index].imageAssetUrl,
                        categoryName: categories[index].categoryName,
                      );
                    }),
              ),
              Container(
                margin: const EdgeInsets.only(top: 16),
                child: ListView.builder(
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    itemCount: _newsInApp.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DetailScreen(
                                    id: _newsInApp[index].id,
                                    title: _newsInApp[index].title,
                                    text: _newsInApp[index].text,
                                    image: _newsInApp[index].image,
                                    author:
                                    _newsInApp[index].author,
                                    date: _newsInApp[index].date,
                                    publisher:
                                    _newsInApp[index].publisher,
                                    url: _newsInApp[index].url,
                                  )));
                        },
                        leading: SizedBox(
                          height: 50,
                          width: 50,
                          child: Image.network(_newsInApp[index].image),
                        ),
                        title: Text(_newsInApp[index].title),
                        subtitle: Text(_newsInApp[index].author),
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

class CategoryCard extends StatelessWidget {
  final String? imageAssetUrl, categoryName;

  const CategoryCard({super.key, this.imageAssetUrl, this.categoryName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => CategoryNews(
                      newsCategory: categoryName!.toLowerCase(),
                    )));
      },
      child: Container(
        margin: const EdgeInsets.only(right: 14),
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Image.asset(imageAssetUrl!),
            ),
            Container(
              alignment: Alignment.center,
              height: 60,
              width: 120,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.black26),
              child: Text(
                categoryName!,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w500),
              ),
            )
          ],
        ),
      ),
    );
  }
}


class Z extends StatefulWidget {
  const Z({Key? key}) : super(key: key);

  @override
  State<Z> createState() => _ZState();
}

class _ZState extends State<Z> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
