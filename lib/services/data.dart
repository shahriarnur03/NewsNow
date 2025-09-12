import 'package:newsnow/models/category_model.dart';

List<CategoryModel> getCategories(){
  List<CategoryModel>category=[];

  CategoryModel categoryModel=new CategoryModel(categoryName: "Business", image: "assets/images/business.jpg");
  category.add(categoryModel);

  categoryModel=new CategoryModel(categoryName: "Entertainment", image: "assets/images/entertainment.jpg");
  category.add(categoryModel);

  categoryModel=new CategoryModel(categoryName: "Science", image: "assets/images/science.jpg");
  category.add(categoryModel);

  categoryModel=new CategoryModel(categoryName: "Sports", image: "assets/images/sports.jpg");
  category.add(categoryModel);

  categoryModel=new CategoryModel(categoryName: "Technology", image: "assets/images/technology.jpg");
  category.add(categoryModel);

  return category;
}