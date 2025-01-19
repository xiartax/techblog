import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tec/models/fake_data.dart';
import 'package:tec/component/my_color.dart';
import 'package:tec/component/my_strings.dart';
import 'package:tec/component/my_conditions.dart';

class MyCats extends StatefulWidget {
  const MyCats({super.key});

  @override
  State<MyCats> createState() => _MyCatsState();
}

class _MyCatsState extends State<MyCats> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var textTheme = Theme.of(context).textTheme;
    double bodyMargin = size.width / 10;
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.only(right: bodyMargin, left: bodyMargin),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 32,
                ),
                SvgPicture.asset(
                  'assets/images/techbot.svg',
                  height: 100,
                ),
                const SizedBox(
                  height: 16,
                ),
                Text(
                  MyStrings.sucsesReghistration,
                  style: textTheme.headlineMedium,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 24, bottom: 42),
                  child: TextField(
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        alignLabelWithHint: true,
                        hintText: "نام  نام خانوادگی",
                        hintStyle: textTheme.headlineSmall),
                  ),
                ),
                Text(
                  MyStrings.choseCats,
                  style: textTheme.headlineMedium,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 24, bottom: 32),
                  child: SizedBox(
                    width: double.infinity,
                    height: 85,
                    child: GridView.builder(
                        itemCount: tagList.length,
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 5,
                                mainAxisSpacing: 5,
                                childAspectRatio: 0.23),
                        itemBuilder: (context, index) {
                          return InkWell(
                              onTap: () {
                                setState(() {
                                  if (!selectedTags.contains(
                                    tagList[index],
                                  )) {
                                    selectedTags.add(tagList[index]);
                                  }
                                });
                              },
                              child:
                                  MainTags(textTheme: textTheme, index: index));
                        }),
                  ),
                ),
                Image.asset(
                  'assets/images/down_arrow.png',
                  scale: 2,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 24, bottom: 32),
                  child: SizedBox(
                    width: double.infinity,
                    height: 45,
                    child: GridView.builder(
                        itemCount: selectedTags.length,
                        shrinkWrap: true,
                        physics: const ClampingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 1,
                                mainAxisSpacing: 5,
                                childAspectRatio: 0.27),
                        itemBuilder: (context, index) {
                          return Container(
                            height: 60,
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(24),
                                ),
                                color: SolidColor.slectTags),
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    selectedTags[index].title,
                                    style: textTheme.headlineMedium,
                                  ),
                                  InkWell(
                                      onTap: () {
                                        setState(() {
                                          selectedTags.removeAt(index);
                                        });
                                      },
                                      child: const Icon(CupertinoIcons.delete)),
                                ],
                              ),
                            ),
                          );
                        }),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 18),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text(
                      'ادامه',
                      style: TextTheme.of(context).headlineSmall,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
