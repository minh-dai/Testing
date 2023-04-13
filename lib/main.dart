import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_fluter/routers/app_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Test Git',
      defaultTransition: Transition.native,
      getPages: AppPages.pages,
    );
  }
}
