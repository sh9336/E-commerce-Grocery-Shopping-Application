import 'package:get/get.dart';
import 'package:shop/route/app_route.dart';
import 'package:shop/view/dashboard/dashboard_binding.dart';
import 'package:shop/view/dashboard/dashboard_screen.dart';

class AppPage{
  static var list = [
    GetPage(
        name: AppRoute.dashboard,
        page: () => const DashboardScreen(),
        binding: DashboardBinding()

    )
  ];
}