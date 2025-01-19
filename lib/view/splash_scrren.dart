import 'package:flutter/material.dart';
import 'package:tec/view/main_page.dart';
import 'package:tec/component/my_color.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class SplashScrren extends StatefulWidget {
  const SplashScrren({super.key});

  @override
  State<SplashScrren> createState() => _SplashScrrenState();
}

class _SplashScrrenState extends State<SplashScrren> {
  @override
  void initState() {
    // ignore: non_constant_identifier_names
    Future.delayed(const Duration(seconds: 3)).then((Value) {
      // ignore: use_build_context_synchronously
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => MainPage()));
    });
    super.initState();
  }

  @override
  Widget build(Object context) {
    return const SafeArea(
        child: Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image(
            image: AssetImage("assets/images/logo.png"),
            height: 70,
          ),
          SizedBox(
            height: 30,
          ),
          SpinKitChasingDots(
            color: SolidColor.colorlo,
            size: 40.0,
          ),
        ],
      ),
    ));
  }
}
