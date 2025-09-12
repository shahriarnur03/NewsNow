import 'package:flutter/material.dart';
import 'package:newsnow/models/category_model.dart';
import 'package:newsnow/services/data.dart';
import 'package:newsnow/views/widgets/type_card.dart';

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});

  @override
  State<ExploreScreen> createState() => _ExploreScreenState();
}

class _ExploreScreenState extends State<ExploreScreen> {
  List<CategoryModel> categories = [];

  @override
  void initState() {
    super.initState();
    categories = getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: GridView.builder(
            itemCount: categories.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,           // 2 rows 
              crossAxisSpacing: 12,        // column gap
              mainAxisSpacing: 12,         // row gap
              childAspectRatio: 1.4,       
            ),
            itemBuilder: (context, index) {
              return TypeCard(
                image: categories[index].image,
                categoryName: categories[index].categoryName,
              );
            },
          ),
        ),
      ),
    );
  }
}
