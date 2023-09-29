
import 'package:hive/hive.dart';
import 'package:shop/model/product.dart';
class LocalProductSevice {
  late Box<Product> _popularProductBox;

  Future<void> init() async {
    _popularProductBox = await Hive.openBox<Product>('PopularProduct');
  }

  Future<void> assignAllPopularProduct({required List<Product> popularProduct}) async {
    await _popularProductBox.clear();
    await _popularProductBox.addAll(popularProduct);
  }

  List<Product> getPopularProduct() => _popularProductBox.values.toList();
}