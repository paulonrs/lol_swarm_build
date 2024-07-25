import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../domain/entities/entities.dart';
import '../../../infra/appRoutes/app_routes.dart';

class HeroIcon extends StatefulWidget {
  final HeroEntity? hero;
  const HeroIcon({super.key, this.hero});

  @override
  HeroIconState createState() => HeroIconState();
}

class HeroIconState extends State<HeroIcon> {
  late HeroEntity? newHero;
  final String selectIcon = 'assets/images/icons/select_area.png';
  final String urlImg = "assets/images/heroes/";

  @override
  void initState() {
    super.initState();
    newHero = widget.hero;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final result = await Get.toNamed(AppRoutes.pageName(AppPages.tela3),
            arguments: newHero);
        if (result != null) {
          setState(() {
            newHero = result;
          });
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Container(
                width: 100.0,
                height: 100.0,
                color: const Color.fromARGB(15, 33, 33, 33),
                child: Image(
                  image: AssetImage(newHero != null
                      ? urlImg + newHero!.imageUrl
                      : selectIcon),
                ),
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              newHero?.name ?? 'Select',
              style: const TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
