import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';
import 'package:tec/component/my_color.dart';
import 'package:tec/component/my_conditions.dart';
import 'package:tec/component/my_strings.dart';
import 'package:tec/view/home_screen.dart';
import 'package:tec/view/profile_screen.dart';
import 'package:tec/view/register_intro.dart';

final GlobalKey<ScaffoldState> _key = GlobalKey();

class MainPage extends StatelessWidget {
  RxInt slectedPageIndex = 0.obs;

  MainPage({super.key});
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    double bodymargin = size.width / 11;
    return SafeArea(
      child: Scaffold(
        key: _key,
        drawer: Drawer(
          backgroundColor: SolidColor.scafoldBg,
          child: Padding(
            padding: EdgeInsets.only(right: bodymargin, left: bodymargin),
            child: ListView(
              children: [
                Center(
                  child: DrawerHeader(
                    child: Image.asset(
                      'assets/images/logo.png',
                      scale: 3,
                    ),
                  ),
                ),
                ListTile(
                  onTap: () {},
                  title: Text(
                    'پروفایل کاربری',
                    style: textTheme.headlineMedium,
                  ),
                ),
                const Divider(
                  color: SolidColor.dividerColor,
                ),
                ListTile(
                    title: Text(
                      'درباره تک‌بلاگ',
                      style: textTheme.headlineMedium,
                    ),
                    onTap: () {}),
                const Divider(
                  color: SolidColor.dividerColor,
                ),
                ListTile(
                  onTap: () async {
                    await Share.share(MyStrings.shareText);
                  },
                  title: Text(
                    'اشتراک گذاری تک بلاگ',
                    style: textTheme.headlineMedium,
                  ),
                ),
                const Divider(
                  color: SolidColor.dividerColor,
                ),
                ListTile(
                  title: Text(
                    'اینستاگرام من',
                    style: textTheme.headlineMedium,
                  ),
                  onTap: () {
                    myLuncherUrl(MyStrings.instaUrl);
                  },
                ),
                const Divider(
                  color: SolidColor.dividerColor,
                ),
              ],
            ),
          ),
        ),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: SolidColor.scafoldBg,
          elevation: 0,
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                child: const Icon(Icons.menu),
                onTap: () {
                  _key.currentState!.openDrawer();
                },
              ),
              Image(
                  image: const AssetImage('assets/images/logo.png'),
                  height: size.height / 13.6),
              const Icon(Icons.search)
            ],
          ),
        ),
        body: Stack(
          children: [
            Positioned.fill(
                child: Obx(
              () => IndexedStack(
                index: slectedPageIndex.value,
                children: [
                  HomeScreen(
                      size: size, textTheme: textTheme, bodymargin: bodymargin),
                  const RegisterIntro(),
                  ProfileScreen(
                      size: size, textTheme: textTheme, bodymargin: bodymargin)
                ],
              ),
            )),
            BotomNav(
              size: size,
              bodymargin: bodymargin,
              changePageScreen: (int value) {
                slectedPageIndex.value = value;
              },
            )
          ],
        ),
      ),
    );
  }
}

class BotomNav extends StatelessWidget {
  const BotomNav({
    super.key,
    required this.size,
    required this.bodymargin,
    required this.changePageScreen,
  });

  final Size size;
  final double bodymargin;
  final Function(int) changePageScreen;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 7,
      right: 0,
      left: 0,
      child: Container(
        height: size.height / 13,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: GradiantColor.bottomNavBar,
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter),
        ),
        child: Padding(
          padding: EdgeInsets.only(right: bodymargin, left: bodymargin),
          child: Container(
            height: size.height / 8,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(16),
              ),
              gradient: LinearGradient(
                  colors: GradiantColor.bottomNav,
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  onPressed: () => changePageScreen(0),
                  icon: const ImageIcon(
                    AssetImage(
                      'assets/icons/home.png',
                    ),
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () => changePageScreen(1),
                  icon: const ImageIcon(
                    AssetImage(
                      'assets/icons/writer.png',
                    ),
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () => changePageScreen(2),
                  icon: const ImageIcon(
                    AssetImage(
                      'assets/icons/user.png',
                    ),
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
