import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'post_model.dart';

class PostDetail extends StatelessWidget {
  final Post post;

  const PostDetail({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Detail Page",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white,
            letterSpacing: 1.5,
          ),
        ),
        backgroundColor: const Color(0xFF6C05EB),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              CircleAvatar(
                radius: 30,
                backgroundColor: const Color.fromARGB(255, 108, 5, 235),
                child: Text(
                  post.id.toString(),
                  style: GoogleFonts.poppins(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Card(
                color: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Title",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: const Color.fromARGB(255, 108, 5, 235),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        post.title,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                        ),
                      ),
                      const Divider(),
                      Text(
                        "Body",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: const Color.fromARGB(255, 108, 5, 235),
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        post.body,
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
