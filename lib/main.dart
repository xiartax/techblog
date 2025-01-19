import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:tec/component/my_color.dart';
import 'package:tec/view/articel_list_screen.dart';
import 'package:tec/view/main_page.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: SolidColor.statusBarColor,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: SolidColor.systemNavigationBarColor,
      systemNavigationBarIconBrightness: Brightness.dark));

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    var size = MediaQuery.of(context).size;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      supportedLocales: const [
        Locale("fa", ""),
      ],
      theme: ThemeData(
        inputDecorationTheme: InputDecorationTheme(
            border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: const BorderSide(width: 2),
        )),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            textStyle: WidgetStateProperty.resolveWith(
              (state) {
                if (state.contains(WidgetState.pressed)) {
                  return textTheme.titleSmall;
                }
                return textTheme.headlineSmall;
              },
            ),
            backgroundColor: WidgetStateColor.resolveWith(
              (state) {
                if (state.contains(WidgetState.pressed)) {
                  return SolidColor.prsedBtn;
                }
                return SolidColor.listTitel;
              },
            ),
          ),
        ),
        fontFamily: 'Vazir',
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
              fontFamily: 'Vazir',
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: SolidColor.textTitel),
          headlineSmall: TextStyle(
              fontFamily: 'Vazir',
              fontSize: 14,
              fontWeight: FontWeight.w300,
              color: SolidColor.headlineSmall),
          headlineMedium: TextStyle(
              fontFamily: 'Vazir',
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: SolidColor.textTitel),
          titleMedium: TextStyle(
              fontFamily: 'Vazir',
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: SolidColor.colorTitel),
          bodySmall: TextStyle(
              fontFamily: 'Vazir',
              fontSize: 13,
              fontWeight: FontWeight.w700,
              color: SolidColor.bodySmall),
          titleLarge: TextStyle(
              fontFamily: 'Vazir',
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: SolidColor.titlarg),
          bodyMedium: TextStyle(
              fontFamily: 'Vazir',
              fontSize: 16,
              fontWeight: FontWeight.w700,
              color: SolidColor.prsedBtn),
          titleSmall: TextStyle(
              fontFamily: 'Vazir',
              fontSize: 16,
              fontWeight: FontWeight.w300,
              color: Colors.white),
        ),
      ),
      // home: const SplashScrren(),
      home: ArticelListScreen(),
    );
  }
}
