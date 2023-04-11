class NewsModel
{
  late String id;
  late String url;
  late String title;
  late String text;
  late String publisher;
  late String author;
  late String image;
  late String date;

  NewsModel(
      this.id,
      this.url,
      this.title,
      this.text,
      this.publisher,
      this.author,
      this.image,
      this.date);

  NewsModel.fromJson(Map<String, dynamic> json){
    id = json['id'];
    url = json['url'];
    title = json['title'];
    text = json['text'];
    publisher = json['publisher'];
    author = json['author'];
    image = json['image'];
    date = json['date'];
  }
}