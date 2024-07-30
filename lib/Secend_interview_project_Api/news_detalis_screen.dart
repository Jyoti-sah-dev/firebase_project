import 'package:firebase_project/Secend_interview_project_Api/provider_class.dart';
import 'package:flutter/material.dart';
import 'package:like_button/like_button.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'favourite_screen.dart';
import 'new_model.dart';

class NewsDetailsScreen extends StatefulWidget {
  final Article article;

  const NewsDetailsScreen({super.key, required this.article});

  @override
  State<NewsDetailsScreen> createState() => _NewsDetailsScreenState();
}

class _NewsDetailsScreenState extends State<NewsDetailsScreen> {
  bool isLiked = false;

  @override
  void initState() {
    super.initState();
    // Delay to ensure that Provider is properly initialized
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkIfFavourite();
    });
  }

  Future<void> _checkIfFavourite() async {
    final newsProvider = Provider.of<NewsProvider>(context, listen: false);
    setState(() {
      isLiked = newsProvider.favouriteTitles.contains(widget.article.title);
    });
  }

  @override
  Widget build(BuildContext context) {
    final newsProvider = Provider.of<NewsProvider>(context);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text(
          widget.article.title ?? 'News Details',
          style: const TextStyle(fontSize: 18, color: Colors.white),
          overflow: TextOverflow.ellipsis,
        ),
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.pink, Colors.pink],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite_border, color: Colors.white),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FavouriteScreen()),
              );
            },
          ),
        ],
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            widget.article.urlToImage == null
                ? const Center(child: CircularProgressIndicator())
                : ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                widget.article.urlToImage!,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              widget.article.title ?? '',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              widget.article.description ?? '',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            Text(
              widget.article.content ?? '',
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                LikeButton(
                  size: 30,
                  isLiked: isLiked,
                  onTap: (isLiked) async {
                    if (!isLiked) {
                      await newsProvider.addFavourite(widget.article);
                    } else {
                      await newsProvider.removeFavourite(widget.article);
                    }
                    // Update isLiked state
                    setState(() {
                      this.isLiked = !isLiked;
                    });
                    return !isLiked;
                  },
                ),
                ElevatedButton(
                  onPressed: _launchUrl,
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    backgroundColor: Colors.pink,
                  ),
                  child: const Text("Open link", style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _launchUrl() async {
    final Uri _url = Uri.parse(widget.article.url ?? '');
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}
