import 'package:comicreadingapp/component/main_header.dart';
import 'package:comicreadingapp/component/popular_category/popular_category_loading.dart';
import 'package:comicreadingapp/component/popular_comic/popular_comic.dart';
import 'package:comicreadingapp/component/popular_comic/popular_comic_loading.dart';
import 'package:comicreadingapp/component/section_title.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../component/carousel_slider/carousel_loading.dart';
import '../../component/carousel_slider/carousel_slider_view.dart';
import '../../component/popular_category/popular_category.dart';
import '../../controller/controllers.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          const SizedBox(height: 30),
          const MainHeader(),
          const SizedBox(height: 20),
          Expanded(
              child: SingleChildScrollView(
                physics: const PageScrollPhysics(),
                child: Column(
                  children: [
                    const SectionTitle(title: "Discover"),
                    Obx(() {
                      if (homeController.bannerList.isNotEmpty) {
                        return CarouselSliderView(
                            bannerList: homeController.bannerList
                        );
                      } else {
                        return const CarouselLoading();
                      }
                    }),
                    const SectionTitle(title: "Popular Categories"),
                    Obx(() {
                      if (homeController.categoryList.isNotEmpty) {
                        return PopularCategory(
                          categories: homeController.categoryList,
                        );
                      } else {
                        return const PopularCategoryLoading();
                      }
                    }),
                    const SizedBox(height: 20),
                    const SectionTitle(title: "Popular Comics"),
                    Obx(() {
                      if (homeController.comicList.isNotEmpty) {
                        return PopularComic(
                            comicList: homeController.comicList);
                      } else {
                        return const PopularComicLoading();
                      }
                    }),
                  ],
                ),
              ))

        ],
      ),
    );
  }
}
