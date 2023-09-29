import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shop/model/product.dart';
import 'package:shop/service/remote_service/remote_product.dart';

class ProductController extends GetxController{
  static ProductController instance = Get.find();
  TextEditingController searchTextEditController = TextEditingController();
  RxString searchVal = ''.obs;
  RxList<Product> productList = List<Product>.empty(growable: true).obs;
  RxBool isProductLoading= false.obs;
  @override
  void onInit() async {
    getProduct();
    super.onInit();
  }
  void getProduct() async {
    try {
      isProductLoading(true);
      var result = await RemoteProductService().get();
      //print(result.body);
      if (result != null) {
        productList.assignAll(productListFromJson(result.body));
      }
    } finally {
      print(productList.length);
      isProductLoading(false);
    }
  }

  void getProductByName({required String keyword}) async{
    try{
      isProductLoading(true);
      var result= await RemoteProductService().getByName(keyword: keyword);
      if(result!=null)
        {
          productList.assignAll(productListFromJson(result.body));
        }
    }  finally{
      isProductLoading(false);
      print(productList.length);
    }
  }

  void getProductByCategory({required int id}) async{
    try{
      isProductLoading(true);
      var result= await RemoteProductService().getByCategory(id: id);
      if(result!=null)
      {
        productList.assignAll(productListFromJson(result.body));
      }
    }  finally{
      isProductLoading(false);
      print(productList.length);
    }
  }
}