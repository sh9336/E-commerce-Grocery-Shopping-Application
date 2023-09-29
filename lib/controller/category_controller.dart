import 'package:get/get.dart';
import 'package:shop/service/local_service/local_category_service.dart';
import 'package:shop/service/remote_service/remote_category_service.dart';

import '../model/category.dart';

class CategoryController extends GetxController {
  static CategoryController instance = Get.find();
  RxList<Category> categoryList = List<Category>.empty(growable: true).obs;
  final LocalCategorySevice _localCategorySevice = LocalCategorySevice();
  RxBool isCategoryLoading = false.obs;
  @override
  void onInit() async {
    await _localCategorySevice.init();
    getCategory();
    super.onInit();
  }

  void getCategory() async {
    try {
      isCategoryLoading(true);
      if (_localCategorySevice.getCategory().isNotEmpty) {
        categoryList.assignAll(_localCategorySevice.getCategory());
      }
      var result = await RemoteCategoryService().get();
      //print(result.body);
      if (result != null) {
        categoryList.assignAll(categoryListFromJson(result.body));
        _localCategorySevice.assignAllCategory(
            category: categoryListFromJson(result.body));
      }
    } finally {
      print(categoryList.length);
      isCategoryLoading(false);
    }
  }
}
