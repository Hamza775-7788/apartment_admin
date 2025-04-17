import 'package:apartment_admin/Features/home/view/home_view_Page.dart';
import 'package:apartment_admin/core/localization/local.dart';
import 'package:apartment_admin/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get_it/get_it.dart';
import 'injection_container.dart' as di;

GetIt? getIt;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  getIt = di.sl;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      locale: Locale("ar"),
      translations: Mylocal(),
      theme: lightMode(context: context),
      home: HomeViewPage(),
    );
  }
}
