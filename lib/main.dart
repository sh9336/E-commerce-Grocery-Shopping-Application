import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/model/category.dart';
import 'package:shop/model/product.dart';
import 'package:shop/route/app_page.dart';
import 'package:shop/route/app_route.dart';
import 'package:shop/theme/app_theme.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'model/add_banner.dart';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();


  //register adapters
  Hive.registerAdapter(AddBannerAdapter());
  Hive.registerAdapter(CategoryAdapter());
  Hive.registerAdapter(ProductAdapter());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      getPages: AppPage.list,
      initialRoute: AppRoute.dashboard,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.light,
    );
  }
}

