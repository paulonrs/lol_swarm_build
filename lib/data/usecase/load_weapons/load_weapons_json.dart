import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:lol_swarm/domain/entities/hero_entity.dart';

import '../../../domain/usecase/usecase.dart';
import '../../entity/entity.dart';

class LoadWeaponsJson implements LoadWeapons {
  @override
  Future<List<WeaponEntity>> load() async {
    final String weaponsResponse =
        await rootBundle.loadString('assets/jsons/weapons.json');
    final weaponsResponseDecode = json.decode(weaponsResponse);
    final weaponsListJson = weaponsResponseDecode["weapons"] as List;
    final weaponsList =
        weaponsListJson.map((json) => WeaponJsonItem.fromJson(json)).toList();
    return weaponsList
        .map((item) => WeaponEntity(
              name: item.name,
              imageUrl: '${item.name}.png',
              description: item.function,
              scalesWith: item.scalesWith
                  .map((string) => Passive.fromString(string))
                  .where((enumValue) => enumValue != null)
                  .cast<Passive>()
                  .toList(),
              upgradeWith: Passive.fromString(item.evolution),
            ))
        .toList();
  }
}
