import 'package:flutter/material.dart';
import 'package:newsnow/models/show_category_model.dart';
import 'package:newsnow/services/show_category_news.dart';
import 'package:newsnow/views/widgets/show_category_card.dart';

class CategoryNewsScreen extends StatefulWidget {
  final String categoryName;
  const CategoryNewsScreen({super.key, required this.categoryName});

  @override
  State<CategoryNewsScreen> createState() => _CategoryNewsScreenState();
}

class _CategoryNewsScreenState extends State<CategoryNewsScreen> {
  List<ShowCategoryModel> categoryList = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    getCategoryNews();
  }

  getCategoryNews() async {
    ShowCategoryNews showCategoryNews = ShowCategoryNews();
    await showCategoryNews.getCategory(widget.categoryName.toLowerCase());
    categoryList = showCategoryNews.categoryList;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 45,
        title: Text(
          widget.categoryName,
          style: const TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.bold, letterSpacing: 1.5),
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: _loading
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: categoryList.length,
              itemBuilder: (context, index) {
                return ShowCategoryCard(
                  image: categoryList[index].imageUrl!,
                  title: categoryList[index].title!,
                  description: categoryList[index].description!,
                );
              },
            ),
    );
  }
}
