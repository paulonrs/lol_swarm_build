import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../domain/entities/entities.dart';
import '../../../infra/appRoutes/app_routes.dart';
import '../../components/components.dart';

class RowHero extends StatefulWidget {
  final HeroEntity? hero;
  const RowHero({super.key, required this.hero});

  @override
  RowHeroState createState() => RowHeroState();
}

class RowHeroState extends State<RowHero> {
  late HeroEntity? hero;

  @override
  void initState() {
    super.initState();
    hero = widget.hero;
  }

  Future<HeroEntity?> handleHeroTap(HeroEntity? tappedHero) async {
    final result = await Get.toNamed(AppRoutes.pageName(AppPages.tela3),
        arguments: tappedHero);
    if (result != null && result is HeroEntity) {
      setState(() {
        hero = result;
      });
      return hero;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        HeroIcon(
          hero: hero,
          onTapFunction: handleHeroTap,
        ),
        hero != null
            ? WeaponIcon(
                weapon: hero?.primaryWeapon,
                disabled: true,
              )
            : const SizedBox(),
      ],
    );
  }
}
