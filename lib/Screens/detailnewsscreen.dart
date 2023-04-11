import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  var id, title, text, image, url, publisher, author, date;

  DetailScreen(
      {Key? key,
      this.id,
      this.title,
      this.text,
      this.image,
      this.url,
      this.publisher,
      this.author,
      this.date})
      : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(widget.image ?? ''),
              Text(
                widget.title ?? '',
                style: const TextStyle(fontSize: 25, color: Colors.red),
              ),
              Text(
                'Author: ${widget.author}',
                style: const TextStyle(fontSize: 20, color: Colors.blueGrey),
              ),
              Text(
                'Date: ${widget.date}',
                style: const TextStyle(fontSize: 15, color: Colors.blueGrey),
              ),
              const SizedBox(
                height: 50,
              ),
              Text(
                widget.text ?? '',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 40,),
              Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  'Published By: ${widget.publisher}',
                  style: const TextStyle(fontSize: 20, color: Colors.indigo),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
