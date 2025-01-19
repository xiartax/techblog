import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:tec/component/api_constant.dart';
import 'package:tec/models/article_modle.dart';
import 'package:tec/models/data_model.dart';
import 'package:tec/models/podcast_model.dart';
import 'package:tec/models/poster_modle.dart';
import 'package:tec/models/tags_modle.dart';
import 'package:tec/services/dio_service.dart';

class HomeScreenController extends GetxController {
  Rx<PosterModelV> poster = PosterModelV().obs;
  RxList<TagsModel> tagsList = RxList();
  RxList<ArticleModel> topVisitedList = RxList();
  RxList<PodcastModel> topPodcast = RxList();
  RxBool loading = false.obs;

  @override
  onInit() {
    super.onInit();
    getHomeItems();
  }

  getHomeItems() async {
    loading.value = true;
    var response = await DioService().getMethod(ApiConstant.getHomeItems);

    if (response.statusCode == 200) {
      response.data['top_visited'].forEach((element) {
        topVisitedList.add(ArticleModel.fromJson(element));
      });
      response.data['top_podcasts'].forEach((element) {
        topPodcast.add(PodcastModel.fromJson(element));
      });

      response.data['tags'].forEach((element) {
        tagsList.add(TagsModel.fromJson(element));
      });

      poster.value = PosterModelV.fromJson(response.data['poster']);
      loading.value = false;
    }
  }
}
