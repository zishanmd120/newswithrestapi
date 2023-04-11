import 'package:newswithrestapi/Model/secondmodel.dart';

List<CategoryModel> getCategories(){

  List<CategoryModel> myCategories = <CategoryModel>[];
  CategoryModel categoryModel;

  //1
  categoryModel = CategoryModel();
  categoryModel.categoryName = "Business";
  categoryModel.imageAssetUrl = "Assets/business.png";
  myCategories.add(categoryModel);

  //2
  categoryModel = CategoryModel();
  categoryModel.categoryName = "Entertainment";
  categoryModel.imageAssetUrl = "Assets/Entertainment.png";
  myCategories.add(categoryModel);

  //3
  categoryModel = CategoryModel();
  categoryModel.categoryName = "General";
  categoryModel.imageAssetUrl = "Assets/General.png";
  myCategories.add(categoryModel);

  //4
  categoryModel = CategoryModel();
  categoryModel.categoryName = "Health";
  categoryModel.imageAssetUrl = "Assets/Health.png";
  myCategories.add(categoryModel);

  //5
  categoryModel = CategoryModel();
  categoryModel.categoryName = "Science";
  categoryModel.imageAssetUrl = "Assets/Science.png";
  myCategories.add(categoryModel);

  //5
  categoryModel = CategoryModel();
  categoryModel.categoryName = "Sports";
  categoryModel.imageAssetUrl = "Assets/Sports.png";
  myCategories.add(categoryModel);

  //5
  categoryModel = CategoryModel();
  categoryModel.categoryName = "Technology";
  categoryModel.imageAssetUrl = "Assets/Technology.png";
  myCategories.add(categoryModel);

  return myCategories;

}