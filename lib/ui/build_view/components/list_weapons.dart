import 'package:flutter/material.dart';

import '../../../domain/entities/entities.dart';
import '../../components/components.dart';

class ListWeapons extends StatelessWidget {
  final List<WeaponEntity?> weapons;
  const ListWeapons({super.key, required this.weapons});

  @override
  Widget build(BuildContext context) {
    List<WeaponEntity?> mutableWeapons = List.from(weapons);
    if (mutableWeapons.length < 4) {
      for (var i = mutableWeapons.length; i < 4; i++) {
        mutableWeapons.add(null);
      }
    }
    return Wrap(
      spacing: 8.0,
      runSpacing: 8.0,
      alignment: WrapAlignment.center,
      children: mutableWeapons.map((weapon) {
        return WeaponIcon(weapon: weapon);
      }).toList(),
    );
  }
}
