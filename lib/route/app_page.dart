import 'package:comicreadingapp/route/app_route.dart';
import 'package:comicreadingapp/view/dashboard/dahboard_binding.dart';
import 'package:comicreadingapp/view/home/welcome_page.dart';
import 'package:get/get.dart';

class AppPage{
  static var list = [
    GetPage(
        name: AppRoute.dashboard,
        page: ()=> const WelcomePage(),
        binding: DashBoardBinding()),
  ];
}