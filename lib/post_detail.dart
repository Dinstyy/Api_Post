import 'package:flutter/material.dart';
import 'post/post_model.dart';

class PostDetail extends StatelessWidget {
  final Post post;

  const PostDetail({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detail Page"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: <Widget>[
              Card(
                color: const Color(0xFFFFE4C4), // Warna pastel cokelat
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    ListTile(
                      title: CircleAvatar(
                        backgroundColor: const Color(0xFFD2B48C), // Senada dengan tema pastel cokelat
                        child: Text(
                          post.id.toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    ListTile(
                      title: const Text(
                        "Title",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.brown,
                        ),
                      ),
                      subtitle: Text(
                        post.title,
                        style: const TextStyle(fontWeight: FontWeight.w400),
                      ),
                    ),
                    const Divider(),
                    ListTile(
                      title: const Text(
                        "Body",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.brown,
                        ),
                      ),
                      subtitle: Text(post.body),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}