import 'package:flutter/material.dart';
import 'package:tec/component/my_color.dart';
import 'package:tec/component/my_conditions.dart';
import 'package:tec/component/test_style.dart';

class ArticelListScreen extends StatelessWidget {
  const ArticelListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: appBar('لیست مقالات'),
    ));
  }
}
