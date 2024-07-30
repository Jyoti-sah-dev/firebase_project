import 'package:firebase_project/Secend_interview_project_Api/provider_class.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'favourite_screen.dart';
import 'news_detalis_screen.dart';

class NewsSearchView extends StatelessWidget {
  const NewsSearchView({super.key});

  @override
  Widget build(BuildContext context) {
    final newsProvider = Provider.of<NewsProvider>(context);

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const FavouriteScreen()),
              );
            },
            icon: const Icon(Icons.favorite_outline, color: Colors.white),
          ),
        ],
        backgroundColor: Colors.pink.shade900,
        centerTitle: true,
        elevation: 50,
        title: const Text("News Categories", style: TextStyle(color: Colors.white, fontSize: 17)),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Container(
              height: 50,
              child: TextField(
                controller: newsProvider.searchController,
                onSubmitted: (value) {
                  newsProvider.fetchNews(newsProvider.selectedCategory, value);
                },
                decoration: InputDecoration(
                  hintText: 'Search for articles...',
                  fillColor: Colors.white,
                  filled: true,
                  suffixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
            child: Container(
              width: double.infinity,
              child: DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                ),
                isExpanded: true,
                value: newsProvider.selectedCategory,
                items: newsProvider.categories.map((String category) {
                  return DropdownMenuItem(
                    value: category,
                    child: Text(category),
                  );
                }).toList(),
                onChanged: (value) {
                  newsProvider.selectedCategory = value;
                  newsProvider.fetchNews(value, newsProvider.searchController.text);
                },
              ),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Consumer<NewsProvider>(
              builder: (context, provider, child) {
                return provider.loading
                    ? const Center(child: CircularProgressIndicator())
                    : provider.articles.isEmpty
                    ? const Center(child: Text('No articles found'))
                    : ListView.builder(
                  itemCount: provider.articles.length,
                  itemBuilder: (_, index) {
                    var article = provider.articles[index];
                    bool isLiked = provider.favouriteTitles.contains(article.title);

                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NewsDetailsScreen(article: article),
                          ),
                        );
                      },
                      child: Card(
                        margin: const EdgeInsets.all(10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        elevation: 5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (article.urlToImage != null)
                              ClipRRect(
                                borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
                                child: Image.network(
                                  article.urlToImage!,
                                  height: 200,
                                  width: double.infinity,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    article.title ?? 'No title',
                                    style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(article.description ?? 'No description'),
                                  const SizedBox(height: 10),
                                  Text(
                                    'Source: ${article.source?.name ?? 'Unknown'}',
                                    style: const TextStyle(fontStyle: FontStyle.italic, color: Colors.blue),
                                  ),
                                  Text("Published at: ${article.publishedAt ?? ""}",style: TextStyle(color: Colors.pinkAccent),),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: IconButton(
                                  icon: Icon(
                                    isLiked ? Icons.favorite : Icons.favorite_border,
                                    color: Colors.red,
                                  ),
                                  onPressed: () {
                                    if (isLiked) {
                                      newsProvider.removeFavourite(article);
                                    } else {
                                      newsProvider.addFavourite(article);
                                    }
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
