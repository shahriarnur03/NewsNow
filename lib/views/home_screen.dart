import 'package:flutter/material.dart';
import 'package:newsnow/models/article_model.dart';
import 'package:newsnow/models/category_model.dart';
import 'package:newsnow/services/data.dart';
import 'package:newsnow/services/news.dart';
import 'package:newsnow/views/widgets/news_card.dart';
import 'package:newsnow/views/widgets/news_horiontal_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<CategoryModel> categories = [];
  List<ArticleModel> articles = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    categories = getCategories();
    getNews();
  }

  getNews() async {
    News newsclass = News();
    await newsclass.getNews();
    articles = newsclass.news;
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // App name
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Text(
                            'News',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.blueAccent,
                            ),
                          ),
                          Text(
                            'Now',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),

                      const Text(
                        'Hottest News',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),

                      Container(
                        height: 280,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: articles.length,
                          itemBuilder: (context, index) {
                            return NewsCard(
                              imageUrl: articles[index].imageUrl!,
                              title: articles[index].title!,
                              desc: articles[index].description!,
                            );
                          },
                        ),
                      ),

                      const SizedBox(height: 20),

                      const Text(
                        'Trending News',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      NewsHorizontalCard(),
                      NewsHorizontalCard(),
                      NewsHorizontalCard(),
                      NewsHorizontalCard(),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
