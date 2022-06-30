import 'package:comicreadingapp/model/comic.dart';
import 'package:comicreadingapp/service/remote_service/remote_library_service.dart';
import 'package:get/get.dart';
import '../model/banner.dart';
import '../model/category.dart';
import '../model/chapter.dart';
import '../model/content.dart';
import '../model/comment.dart';
import '../model/library.dart';
import '../service/remote_service/mylibrary_service.dart';
import '../service/remote_service/remote_banner_service.dart';
import '../service/remote_service/remote_category_service.dart';
import '../service/remote_service/remote_chapter_service.dart';
import '../service/remote_service/remote_comment_service.dart';
import '../service/remote_service/remote_content_service.dart';
import '../service/remote_service/remote_popular_comic_service.dart';
import '../service/remote_service/remote_trending_comic_service.dart';

class HomeController extends GetxController {
  static HomeController instance = Get.find();
  RxList<AdBanner> bannerList = List<AdBanner>.empty(growable: true).obs;
  RxList<Category> categoryList = List<Category>.empty(growable: true).obs;
  RxList<Comic> comicList = List<Comic>.empty(growable: true).obs;
  RxList<Chapter> chapterList = List<Chapter>.empty(growable: true).obs;
  RxList<Content> contentList = List<Content>.empty(growable: true).obs;
  RxList<Comment> commentList = List<Comment>.empty(growable: true).obs;
  RxList<Comic> trendingComicList = List<Comic>.empty(growable: true).obs;
  RxList<Library> libraryList = List<Library>.empty(growable: true).obs;
  RxBool isBannerLoading = false.obs;
  RxBool isCategoryLoading = false.obs;
  RxBool isComicLoading = false.obs;
  RxBool isChapterLoading = false.obs;
  RxBool isContentLoading = false.obs;
  RxBool isCommentLoading = false.obs;
  RxBool isTrendingComicLoading = false.obs;
  RxBool isLibraryLoading = false.obs;

  @override
  void onInit() {
    getAdBanners();
    getCategories();
    getComics();
    getChapters();
    getContents();
    getComments();
    getTrendingComics();
    getLibrary();
    super.onInit();
  }

  void getAdBanners() async{
    try{
      isBannerLoading(true);
      var result = await RemoteBannerService().get();
      if (result != null) {
        bannerList.assignAll(adBannerListFromJson(result.body));
      }
    } finally {
     isBannerLoading(false);
    }
  }

  void getCategories() async{
    try{
      isCategoryLoading(true);
      var result = await RemoteCategoryService().get();
      if (result != null) {
        categoryList.assignAll(categoryListFromJson(result.body));
      }
    } finally {
      isBannerLoading(false);
    }
  }

  void getComics() async{
    try{
      isComicLoading(true);
      var result = await RemotePopularComicService().get();
      if (result != null) {
        comicList.assignAll(comicListFromJson(result.body));
      }
    } finally {
      isComicLoading(false);
    }
  }

  void getChapters() async{
    try{
      isChapterLoading(true);
      var result = await RemoteChapterService().get();
      if (result != null) {
        chapterList.assignAll(chapterListFromJson(result.body));
      }
    } finally {
      isChapterLoading(false);
    }
  }

  void getContents() async{
    try{
      isContentLoading(true);
      var result = await RemoteContentService().get();
      if (result != null) {
        contentList.assignAll(contentListFromJson(result.body));
      }
    } finally {
      isContentLoading(false);
    }
  }

  void getComments() async{
    try{
      isCommentLoading(true);
      var result = await RemoteCommentService().get();
      if (result != null) {
        commentList.assignAll(commentListFromJson(result.body));
      }
    } finally {
      isCommentLoading(false);
    }
  }

  void getTrendingComics() async{
    try{
      isTrendingComicLoading(true);
      var result = await RemoteTrendingComicService().get();
      if (result != null) {
        trendingComicList.assignAll(comicListFromJson(result.body));
      }
    } finally {
      isTrendingComicLoading(false);
    }
  }

  void getLibrary() async{
    try{
      isLibraryLoading(true);
      var result = await RemoteLibraryService().get();
      if (result != null) {
        libraryList.assignAll(libraryListFromJson(result.body));
      }
    } finally {
      isLibraryLoading(false);
    }
  }
}