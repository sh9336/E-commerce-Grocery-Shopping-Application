import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/controller/category_controller.dart';
import 'package:shop/controller/dashboard_controller.dart';
import 'package:shop/controller/home_controller.dart';
import 'package:shop/controller/product_controller.dart';
class DashboardBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(DashboardController());
    Get.put(HomeController());
    Get.put(ProductController());
    Get.put(CategoryController());
  }
}