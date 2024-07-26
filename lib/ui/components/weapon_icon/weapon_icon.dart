import 'package:flutter/material.dart';

import '../../../domain/entities/entities.dart';

class WeaponIcon extends StatelessWidget {
  final WeaponEntity? weapon;
  final Future<WeaponEntity?> Function(WeaponEntity?) onTapFunction;
  final bool disabled;

  const WeaponIcon(
      {super.key,
      this.weapon,
      this.disabled = false,
      this.onTapFunction = _defaultOnTapFunction});

  static Future<WeaponEntity?> _defaultOnTapFunction(
      WeaponEntity? weapon) async {
    return weapon;
  }

  @override
  Widget build(BuildContext context) {
    WeaponEntity? weapon = this.weapon;
    String urlImg = weapon != null
        ? 'assets/images/weapons/${weapon.imageUrl}'
        : 'assets/images/icons/select_area.png';
    return GestureDetector(
      onTap: () async {
        if (!disabled) {
          final result = await onTapFunction(weapon);
          if (result != null) {
            weapon = result;
          }
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
                child: Image.asset(
                  urlImg,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              weapon?.name ?? 'Select',
              style: const TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
