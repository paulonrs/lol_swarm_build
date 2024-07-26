// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lol_swarm/infra/appRoutes/app_routes.dart';

import 'factories/factories.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    final routeObserver = Get.put<RouteObserver>(RouteObserver<PageRoute>());

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      navigatorObservers: [routeObserver],
      initialRoute: AppRoutes.pageName(AppPages.buildView),
      getPages: [
        GetPage(
          name: AppRoutes.pageName(AppPages.buildView),
          page: makeBuildViewPage,
          transition: Transition.fade,
        ),
        GetPage(
          name: AppRoutes.pageName(AppPages.tela2),
          page: makeTela2Page,
          transition: Transition.fade,
        ),
        GetPage(
          name: AppRoutes.pageName(AppPages.tela3),
          page: makeTela3Page,
          transition: Transition.fade,
        ),
      ],
    );
  }
}
