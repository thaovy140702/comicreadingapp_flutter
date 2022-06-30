import 'package:comicreadingapp/controller/controllers.dart';
import 'package:comicreadingapp/controller/dashboard_controller.dart';
import 'package:comicreadingapp/view/home/home_screen.dart';
import 'package:comicreadingapp/view/home/my_page.dart';
import 'package:comicreadingapp/view/home/trending_comic_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:get/get.dart';
import '../home/comic_search_page.dart';


class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
        builder: (controller) => Scaffold(
          body: SafeArea(
            child: IndexedStack(
              index: controller.tabIndex,
              children: [
                const HomeScreen(),
                TrendingComicPage(comics: homeController.trendingComicList),
                ComicSearchPage(),
                const MyPage()
              ],
            ),
          ),
          bottomNavigationBar: Container(
              decoration: const BoxDecoration(
                  color: Colors.white,
                  border:Border(
                      top: BorderSide(
                          color: Colors.black,
                          width: 1.2
                      )
                  )
              ),

              child: SnakeNavigationBar.color(
                behaviour: SnakeBarBehaviour.floating,
                snakeShape: SnakeShape.circle,

                padding: const EdgeInsets.symmetric(vertical: 5),
                unselectedLabelStyle: const TextStyle(
                  fontSize: 11,
                ),
                snakeViewColor: Colors.green,
                unselectedItemColor: Colors.black,
                showUnselectedLabels: true,
                currentIndex: controller.tabIndex,
                onTap:(val){
                  controller.updateIndex(val);
                },
                items: const [
                  BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
                  BottomNavigationBarItem(icon: Icon(Icons.category), label: 'Trending'),
                  BottomNavigationBarItem(icon: Icon(Icons.search), label:'Search'),
                  BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: 'My account')
                ],
              )
          ),
        ),);
  }
}
