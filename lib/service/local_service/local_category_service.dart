
import 'package:hive/hive.dart';
import '../../model/category.dart';

class LocalCategorySevice {
  late Box<Category> _popularCategoryBox;
  late Box<Category> _categoryBox;
  Future<void> init() async {
    _popularCategoryBox = await Hive.openBox<Category>('PopularCategory');
    _categoryBox = await Hive.openBox<Category>('Category');
  }

  Future<void> assignAllPopularCategory({required List<Category> popularCategory}) async {
    await _popularCategoryBox.clear();
    await _popularCategoryBox.addAll(popularCategory);
  }
  Future<void> assignAllCategory({required List<Category> category}) async {
    await _categoryBox.clear();
    await _categoryBox.addAll(category);
  }

  List<Category> getPopularCategory() => _popularCategoryBox.values.toList();
  List<Category> getCategory() => _categoryBox.values.toList();
}