import 'dart:convert';

import 'package:lol_swarm/domain/entities/hero_entity.dart';
import 'package:flutter/services.dart' show rootBundle;

import '../../../domain/usecase/usecase.dart';

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

class HeroJsonItem {
  final String name;
  final String imageUrl;
  final String primaryWeapon;

  HeroJsonItem(
      {required this.name,
      required this.imageUrl,
      required this.primaryWeapon});

  factory HeroJsonItem.fromJson(Map<String, dynamic> json) {
    return HeroJsonItem(
      name: json['name'],
      imageUrl: json['imageUrl'],
      primaryWeapon: json['primaryWeapon'],
    );
  }
}

class WeaponHeroJsonItem {
  final String hero;
  final String imageUrl;
  final String name;
  final String function;
  final List<String> scalesWith;
  final String evolution;

  WeaponHeroJsonItem(
      {required this.hero,
      required this.imageUrl,
      required this.name,
      required this.function,
      required this.scalesWith,
      required this.evolution});

  factory WeaponHeroJsonItem.fromJson(Map<String, dynamic> json) {
    List<String> scalesWithList = (json['scalesWith'] as List<dynamic>)
        .map((item) => item as String)
        .toList();

    return WeaponHeroJsonItem(
      hero: json["hero"],
      imageUrl: json["imageUrl"],
      name: json["name"],
      function: json["function"],
      scalesWith: scalesWithList,
      evolution: json["evolution"],
    );
  }
}
