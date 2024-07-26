import 'dart:convert';

import 'package:lol_swarm/domain/entities/hero_entity.dart';
import 'package:flutter/services.dart' show rootBundle;

import '../../../domain/usecase/usecase.dart';
import '../../data.dart';

class LoadHeroesJson implements LoadHeroes {
  @override
  Future<List<HeroEntity>> load() async {
    final String heroesResponse =
        await rootBundle.loadString('assets/jsons/heroes.json');
    final heroesResponseDecode = json.decode(heroesResponse);
    final heroesListJson = heroesResponseDecode["heroes"] as List;
    final heroesList =
        heroesListJson.map((json) => HeroJsonItem.fromJson(json)).toList();

    final String weaponsHeroesResponse =
        await rootBundle.loadString('assets/jsons/weapons_heroes.json');
    final weaponsHeroesResponseDecode = json.decode(weaponsHeroesResponse);
    final weaponsHeroesListJson =
        weaponsHeroesResponseDecode["weapons_heroes"] as List;
    final weaponsHeroesList = weaponsHeroesListJson
        .map((json) => WeaponHeroJsonItem.fromJson(json))
        .toList();
    final weaponsHeroesListEntity = weaponsHeroesList
        .map((item) => WeaponEntity(
              name: item.name,
              imageUrl: 'weapons_hero/${item.imageUrl}',
              description: item.function,
              scalesWith: item.scalesWith
                  .map((string) => Passive.fromString(string))
                  .where((enumValue) => enumValue != null)
                  .cast<Passive>()
                  .toList(),
              upgradeWith: Passive.fromString(item.evolution),
            ))
        .toList();

    return heroesList
        .map((item) => HeroEntity(
              name: item.name,
              imageUrl: item.imageUrl,
              primaryWeapon: weaponsHeroesListEntity
                  .firstWhere((weapon) => weapon.name == item.primaryWeapon),
              skill: null,
              ultimate: null,
            ))
        .toList();
  }
}
