import 'package:flutter/material.dart';

import '../../../domain/entities/entities.dart';

class HeroIcon extends StatelessWidget {
  final HeroEntity? hero;
  final Future<HeroEntity?> Function(HeroEntity?) onTapFunction;

  const HeroIcon({super.key, this.hero, required this.onTapFunction});

  @override
  Widget build(BuildContext context) {
    HeroEntity? hero = this.hero;
    const String selectIcon = 'assets/images/icons/select_area.png';
    const String urlImgFolder = "assets/images/heroes/";

    return GestureDetector(
      onTap: () async {
        final result = await onTapFunction(hero);
        if (result != null) {
          hero = result;
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
                  image: AssetImage(hero != null
                      ? urlImgFolder + hero!.imageUrl
                      : selectIcon),
                ),
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              hero?.name ?? 'Select',
              style: const TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
