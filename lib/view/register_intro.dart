import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tec/component/my_color.dart';
import 'package:tec/component/my_strings.dart';
import 'package:tec/view/my_cats.dart';

class RegisterIntro extends StatelessWidget {
  const RegisterIntro({super.key});

  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;

    return SafeArea(
        child: Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              const AssetImage('assets/images/techbot.svg').assetName,
              height: 100,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 9),
              child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                      text: MyStrings.wellcome,
                      style: textTheme.headlineMedium)),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 18),
              child: ElevatedButton(
                onPressed: () {
                  _showBottomSheet(context, size, textTheme);
                },
                child: Text(
                  'بزن بریم',
                  style: TextTheme.of(context).headlineSmall,
                ),
              ),
            ),
          ],
        ),
      ),
    ));
  }

  Future<dynamic> _showBottomSheet(
      BuildContext context, Size size, TextTheme textTheme) {
    return showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              height: size.height / 2,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  color: Colors.white),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      MyStrings.insertYourEmail,
                      style: textTheme.bodyMedium,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(28, 42, 28, 28),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'imarta@gmail.com',
                          hintStyle: textTheme.headlineSmall,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        _activeCodeBottomSheet(context, size, textTheme);
                      },
                      child: Text(
                        'ادامه',
                        style: textTheme.titleLarge,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  Future<dynamic> _activeCodeBottomSheet(
      BuildContext context, Size size, TextTheme textTheme) {
    return showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              height: size.height / 2,
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                  color: Colors.white),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      MyStrings.insertYourCode,
                      style: textTheme.bodyMedium,
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(28, 42, 28, 28),
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: '******',
                          hintStyle: textTheme.headlineSmall,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                            MaterialPageRoute(builder: (context) => MyCats()));
                      },
                      child: Text(
                        'ادامه',
                        style: textTheme.titleLarge,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
