import 'package:tec/component/api_constant.dart';

class PosterModelV {
  String? id;
  String? title;
  String? image;

  PosterModelV({
    this.id,
    this.title,
    this.image,
  });
  PosterModelV.fromJson(Map<String, dynamic> element) {
    id = element["id"];
    title = element["title"];
    image = ApiConstant.hostDiUrl + element["image"];
  }
}
