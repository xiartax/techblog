import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:tec/controller/home_screen_controller.dart';
import 'package:tec/models/fake_data.dart';
import 'package:tec/component/my_color.dart';
import 'package:tec/component/my_strings.dart';
import 'package:tec/component/my_conditions.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({
    super.key,
    required this.size,
    required this.textTheme,
    required this.bodymargin,
  });

  HomeScreenController homeScreenController = Get.put(HomeScreenController());

  final Size size;
  final TextTheme textTheme;
  final double bodymargin;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Obx(
        () => Padding(
          padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
          child: homeScreenController.loading.value == false
              ? Column(
                  children: [
                    poster(),
                    const SizedBox(
                      height: 14,
                    ),
                    tags(),
                    const SizedBox(
                      height: 32,
                    ),
                    SeeMoreBlog(bodymargin: bodymargin, textTheme: textTheme),
                    topVisited(),
                    const SizedBox(
                      height: 32,
                    ),
                    SeeMorePodcast(
                        bodymargin: bodymargin, textTheme: textTheme),
                    topPodcastV(),
                    const SizedBox(
                      height: 65,
                    )
                  ],
                )
              : Loading(),
        ),
      ),
    );
  }

  Widget topVisited() {
    return SizedBox(
      height: size.height / 3.4,
      child: Obx(
        () => ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: homeScreenController.topVisitedList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(right: index == 0 ? bodymargin : 15),
              child: Column(
                children: [
                  SizedBox(
                    height: size.height / 5.2,
                    width: size.width / 2.1,
                    child: Stack(
                      children: [
                        CachedNetworkImage(
                          imageUrl:
                              homeScreenController.topVisitedList[index].image!,
                          imageBuilder: (context, imageProvider) => Container(
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(16),
                              ),
                              image: DecorationImage(
                                  image: imageProvider, fit: BoxFit.cover),
                            ),
                            foregroundDecoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(16),
                              ),
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: GradiantColor.posterImage,
                              ),
                            ),
                          ),
                          placeholder: (context, url) => const Loading(),
                          errorWidget: (context, url, error) => const Icon(
                            Icons.image_not_supported_outlined,
                            color: Colors.grey,
                            size: 50,
                          ),
                        ),
                        Positioned(
                          bottom: 8,
                          left: 0,
                          right: 0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                homeScreenController
                                    .topVisitedList[index].author!,
                                style: textTheme.titleSmall,
                              ),
                              Text(
                                homeScreenController
                                    .topVisitedList[index].view!,
                                style: textTheme.titleSmall,
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                    width: size.width / 2,
                    child: Text(
                      homeScreenController.topVisitedList[index].title!,
                      style: textTheme.headlineLarge,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget topPodcastV() {
    return SizedBox(
      height: size.height / 5.1,
      child: Obx(
        () => ListView.builder(
            itemCount: homeScreenController.topPodcast.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Padding(
                    padding:
                        EdgeInsets.only(right: index == 0 ? bodymargin : 15),
                    child: SizedBox(
                        height: size.height / 6.8,
                        width: size.width / 2.2,
                        child: CachedNetworkImage(
                          imageUrl:
                              homeScreenController.topPodcast[index].poster!,
                          imageBuilder: (context, imageProvider) => Container(
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.all(
                                Radius.circular(16),
                              ),
                              image: DecorationImage(
                                  image: imageProvider, fit: BoxFit.cover),
                            ),
                          ),
                          placeholder: (context, url) => Loading(),
                          errorWidget: (context, url, error) => const Icon(
                            Icons.image_not_supported_outlined,
                            color: Colors.grey,
                            size: 50,
                          ),
                        )),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  SizedBox(
                    child: Text(
                      homeScreenController.topPodcast[index].title!,
                      style: textTheme.headlineLarge,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              );
            }),
      ),
    );
  }

  Widget poster() {
    return Obx(
      () => Stack(children: [
        Container(
          height: size.height / 4.2,
          width: size.width / 1.25,
          child: CachedNetworkImage(
            imageUrl: homeScreenController.poster.value.image!,
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(
                  Radius.circular(16),
                ),
                image: DecorationImage(image: imageProvider, fit: BoxFit.cover),
              ),
            ),
            placeholder: (context, url) => const SpinKitChasingDots(
              color: SolidColor.colorlo,
              size: 28,
            ),
            errorWidget: (context, url, error) => const Icon(
              Icons.image_not_supported_outlined,
              color: Colors.grey,
              size: 50,
            ),
          ),
          foregroundDecoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(25),
            ),
            gradient: LinearGradient(
              colors: GradiantColor.homePagePosterColor,
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
        ),
        Positioned(
          bottom: 8,
          left: 8,
          right: 0,
          child: Column(
            children: [
              Text(
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
                homeScreenController.poster.value.title!,
                style: textTheme.titleLarge,
              ),
            ],
          ),
        ),
      ]),
    );
  }

  Widget tags() {
    return SizedBox(
      height: 60,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: tagList.length,
          itemBuilder: (context, index) {
            return Padding(
              padding:
                  EdgeInsets.fromLTRB(8, 8, index == 0 ? bodymargin : 10, 8),
              child: MainTags(textTheme: textTheme, index: index),
            );
          }),
    );
  }
}

class SeeMorePodcast extends StatelessWidget {
  const SeeMorePodcast({
    super.key,
    required this.bodymargin,
    required this.textTheme,
  });

  final double bodymargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: bodymargin, bottom: 15),
      child: Row(
        children: [
          const ImageIcon(
            AssetImage(
              'assets/icons/mic.png',
            ),
            color: SolidColor.colorTitel,
            size: 18,
          ),
          const SizedBox(
            width: 8,
          ),
          Text(
            MyStrings.viewHotestPodcast,
            style: textTheme.titleMedium,
          )
        ],
      ),
    );
  }
}

class SeeMoreBlog extends StatelessWidget {
  const SeeMoreBlog({
    super.key,
    required this.bodymargin,
    required this.textTheme,
  });

  final double bodymargin;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: bodymargin, bottom: 16),
      child: Row(
        children: [
          const ImageIcon(
            AssetImage('assets/icons/blupen.png'),
            color: SolidColor.colorTitel,
            size: 18,
          ),
          const SizedBox(
            width: 12,
          ),
          Text(
            MyStrings.viewHotestPodcast,
            style: textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}
