import 'package:flutter/material.dart';
import 'package:tec/component/my_color.dart';
import 'package:tec/component/my_strings.dart';
import 'package:tec/component/my_conditions.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    super.key,
    required this.size,
    required this.textTheme,
    required this.bodymargin,
  });

  final Size size;
  final TextTheme textTheme;
  final double bodymargin;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.only(top: 42),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(
              image: AssetImage(
                'assets/images/avatar.png',
              ),
              height: 100,
            ),
            const SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const ImageIcon(
                  AssetImage(
                    'assets/icons/blupen.png',
                  ),
                  color: SolidColor.colorTitel,
                  size: 20,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  MyStrings.imageProfileEdit,
                  style: textTheme.titleMedium,
                ),
              ],
            ),
            const SizedBox(
              height: 60,
            ),
            Text(
              'فاطمه امیری',
              style: textTheme.headlineMedium,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              'FatemeAmiri@gmail.com',
              style: textTheme.headlineMedium,
            ),
            const SizedBox(
              height: 60,
            ),
            MyDivider(size: size),
            InkWell(
              onTap: () {},
              splashColor: SolidColor.colorlo,
              child: SizedBox(
                height: 45,
                child: Center(
                  child: Text(
                    MyStrings.myFavPost,
                    style: textTheme.headlineMedium,
                  ),
                ),
              ),
            ),
            MyDivider(size: size),
            InkWell(
              onTap: () {},
              splashColor: SolidColor.colorlo,
              child: SizedBox(
                height: 45,
                child: Center(
                  child: Text(
                    MyStrings.myFavPodcast,
                    style: textTheme.headlineMedium,
                  ),
                ),
              ),
            ),
            MyDivider(size: size),
            InkWell(
              onTap: () {},
              splashColor: SolidColor.colorlo,
              child: SizedBox(
                height: 45,
                child: Center(
                  child: Text(
                    MyStrings.logOute,
                    style: textTheme.headlineMedium,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 65,
            ),
          ],
        ),
      ),
    );
  }
}
