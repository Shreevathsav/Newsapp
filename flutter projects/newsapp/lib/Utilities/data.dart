import 'package:newsapp/DataModels/categoryData.dart';

List<Category> getCategory() {
  // ignore: deprecated_member_use
  List<Category> category = <Category>[];
  Category categoryModel = new Category();

  categoryModel.catName = "Business";
  categoryModel.imgUrl =
      "https://images.unsplash.com/photo-1551135049-8a33b5883817?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1000&q=100";
  category.add(categoryModel);

  categoryModel = new Category();
  categoryModel.catName = "Sports";
  categoryModel.imgUrl =
      "https://images.unsplash.com/photo-1461896836934-ffe607ba8211?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1000&q=80";
  category.add(categoryModel);

  categoryModel = new Category();
  categoryModel.catName = "Entertainment";
  categoryModel.imgUrl =
      "https://images.unsplash.com/photo-1603190287605-e6ade32fa852?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80";
  category.add(categoryModel);

  categoryModel = new Category();
  categoryModel.catName = "Health";
  categoryModel.imgUrl =
      "https://images.unsplash.com/photo-1505751172876-fa1923c5c528?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80";
  category.add(categoryModel);

  categoryModel = new Category();
  categoryModel.catName = "Science";
  categoryModel.imgUrl =
      "https://images.unsplash.com/photo-1567427018141-0584cfcbf1b8?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1000&q=80";
  category.add(categoryModel);

  categoryModel = new Category();
  categoryModel.catName = "Technology";
  categoryModel.imgUrl =
      "https://images.unsplash.com/photo-1518770660439-4636190af475?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80";
  category.add(categoryModel);

  return category;
}
