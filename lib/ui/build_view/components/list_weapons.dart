import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../domain/entities/entities.dart';
import '../../../infra/appRoutes/app_routes.dart';
import '../../components/components.dart';

class ListWeapons extends StatefulWidget {
  final List<WeaponEntity?> weapons;
  const ListWeapons({super.key, required this.weapons});

  @override
  ListWeaponsState createState() => ListWeaponsState();
}

class ListWeaponsState extends State<ListWeapons> {
  late List<WeaponEntity?> weapons;
  late WeaponEntity? weapon;

  @override
  void initState() {
    super.initState();
    weapons = widget.weapons;
  }

  Future<WeaponEntity?> handleWeaponTap(WeaponEntity? tappedWeapon) async {
    final result = await Get.toNamed(AppRoutes.pageName(AppPages.selectWeapon),
        arguments: tappedWeapon);
    if (result != null && result is WeaponEntity) {
      setState(() {
        weapon = result;
      });
      return weapon;
    }
    return null;
  }

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
        return WeaponIcon(weapon: weapon, onTapFunction: handleWeaponTap);
      }).toList(),
    );
  }
}
