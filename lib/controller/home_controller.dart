import 'package:get/get.dart';
import 'package:shop/model/add_banner.dart';
import 'package:shop/model/category.dart';
import 'package:shop/model/product.dart';
import 'package:shop/service/local_service/local_add_banner_service.dart';
import 'package:shop/service/local_service/local_category_service.dart';
import 'package:shop/service/local_service/local_product_service.dart';
import 'package:shop/service/remote_service/remote_banner_service.dart';
import 'package:shop/service/remote_service/remote_popular_category_service.dart';
import 'package:shop/service/remote_service/remote_popular_product_service.dart';

class HomeController extends GetxController {
  static HomeController instance = Get.find();
  RxList<AddBanner> bannerList = List<AddBanner>.empty(growable: true).obs;
  RxList<Category> popularCategoryList =
      List<Category>.empty(growable: true).obs;
  RxList<Product> popularProductList = List<Product>.empty(growable: true).obs;
  RxBool isBannerLoading = false.obs;
  RxBool isPopularCategoryLoading = false.obs;
  RxBool isPopularProductLoading = false.obs;
  final LocalAddBannerSevice _localAddBannerSevice = LocalAddBannerSevice();
  final LocalCategorySevice _localCategorySevice = LocalCategorySevice();
  final LocalProductSevice _localProductSevice = LocalProductSevice();
  @override
  void onInit() async {
    await _localAddBannerSevice.init();
    await _localCategorySevice.init();
    await _localProductSevice.init();
    getAddBanners();
    getPopularCategory();
    getPopularProduct();
    super.onInit();
  }

  void getAddBanners() async {
    try {
      isBannerLoading(true);
      //assigning local ad banners before call api
      if (_localAddBannerSevice.getAddBanners().isNotEmpty) {
        bannerList.assignAll(_localAddBannerSevice.getAddBanners());
      }
      //call api
      var result = await RemoteBannerService().get();
      if (result != null) {
        //assign api result
        bannerList.assignAll(addBannerListFromJson(result.body));
        //save api result to local db
        _localAddBannerSevice.assignAllAddbanners(
            addBanners: addBannerListFromJson(result.body));
      }
    } finally {
      //print(bannerList.first.image);
      isBannerLoading(false);
    }
  }

  void getPopularCategory() async {
    try {
      isPopularCategoryLoading(true);
      //assigning local ad banners before call api
      if (_localCategorySevice.getPopularCategory().isNotEmpty) {
        popularCategoryList
            .assignAll(_localCategorySevice.getPopularCategory());
      }
      //call api
      var result = await RemotePopularCategoryService().get();
      if (result != null) {
        popularCategoryList.assignAll(popularCategoryListFromJson(result.body));
        //save api result to local db
        _localCategorySevice.assignAllPopularCategory(
            popularCategory: popularCategoryListFromJson(result.body));
      }
    } finally {
      //print(popularCategoryList.length);
      isPopularCategoryLoading(false);
    }
  }

  void getPopularProduct() async {
    try {
      isPopularProductLoading(true);
      //assigning local ad banners before call api
      if (_localProductSevice.getPopularProduct().isNotEmpty) {
        popularProductList.assignAll(_localProductSevice.getPopularProduct());
      }
      var result = await RemotePopularProductService().get();
      //print(result.body);
      if (result != null) {
        popularProductList.assignAll(popularProductListFromJson(result.body));
        //save api result to local db
        _localProductSevice.assignAllPopularProduct(
            popularProduct: popularProductListFromJson(result.body));
      }
    } finally {
      //print(popularProductList.length);
      isPopularProductLoading(false);
    }
  }
}
