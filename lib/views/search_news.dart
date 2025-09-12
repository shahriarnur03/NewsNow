import 'package:flutter/material.dart';
import 'package:newsnow/models/article_model.dart';
import 'package:newsnow/services/news.dart';
import 'package:newsnow/views/widgets/category_news_card.dart';

class SearchNews extends StatefulWidget {
  const SearchNews({super.key});

  @override
  State<SearchNews> createState() => _SearchNewsState();
}

class _SearchNewsState extends State<SearchNews> {
  final TextEditingController _searchController = TextEditingController();
  List<ArticleModel> _articles = [];
  bool _loading = false;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _searchNews() async {
    if (_searchController.text.isNotEmpty) {
      setState(() {
        _loading = true;
        _articles = [];
      });
      News news = News();
      List<ArticleModel> articles = await news.getNewsWithSearchQuery(_searchController.text);
      setState(() {
        _articles = articles;
        _loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Search News',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  controller: _searchController,
                  decoration: InputDecoration(
                    hintText: 'Search for news...',
                    border: InputBorder.none,
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () => _searchController.clear(),
                    ),
                  ),
                  onSubmitted: (value) => _searchNews(),
                ),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: _loading
                    ? const Center(child: CircularProgressIndicator())
                    : _articles.isEmpty
                        ? const Center(child: Text('No articles found.'))
                        : ListView.builder(
                            itemCount: _articles.length,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 16.0),
                                child: NewsTallCardItem(
                                  imageUrl: _articles[index].imageUrl!,
                                  title: _articles[index].title!,
                                  description: _articles[index].description!,
                                  url: _articles[index].url!,
                                ),
                              );
                            },
                          ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
