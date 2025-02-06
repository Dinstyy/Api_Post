import 'package:flutter/material.dart';
import 'postpage/http_service.dart';
import '../post/post_model.dart';
import 'post_detail.dart';

class PostsPage extends StatelessWidget {
  final HttpService httpService = HttpService();

  PostsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Post"),
      ),
      body: FutureBuilder(
        future: httpService.getPosts(),
        builder: (BuildContext context, AsyncSnapshot<List<Post>> snapshot) {
          if (snapshot.hasData) {
            List<Post>? posts = snapshot.data;
            return ListView.builder(
              itemCount: posts!.length,
              itemBuilder: (context, index) {
                final post = posts[index];
                return GestureDetector(
                  onTap: () {
                    // Navigasi ke PostDetail dengan parameter post
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PostDetail(post: post),
                      ),
                    );
                  },
                  child: Card(
                    elevation: 4, // Efek bayangan pada Card
                    margin: const EdgeInsets.symmetric(
                        vertical: 8, horizontal: 16), // Margin antar card
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16), // Sudut melengkung
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16), // Padding dalam Card
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Nomor dalam lingkaran abu-abu
                          CircleAvatar(
                            radius: 16, // Ukuran lingkaran
                            backgroundColor: Colors.grey[300], // Warna abu-abu
                            child: Text(
                              (index + 1).toString(), // Nomor item
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ),
                          const SizedBox(width: 16), // Jarak antara nomor dan konten
                          // Konten teks
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  post.title,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 8), // Jarak antar elemen
                                Text(
                                  "User ID: ${post.userId}",
                                  style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}