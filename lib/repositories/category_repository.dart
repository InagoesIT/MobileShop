import 'package:mobile_shop/models/category.dart';

abstract class CategoryRepository {
  Future<List<Category>> getCategories();
}