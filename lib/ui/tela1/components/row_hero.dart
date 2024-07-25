import 'package:flutter/material.dart';

import '../../../domain/entities/entities.dart';
import '../../components/components.dart';

class RowHero extends StatelessWidget {
  final HeroEntity? hero;
  const RowHero({super.key, required this.hero});

  @override
  Widget build(BuildContext context) {
    debugPrint('hero: $hero');
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        HeroIcon(
          hero: hero,
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
