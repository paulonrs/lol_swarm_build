import 'dart:convert';

import 'package:lol_swarm/domain/entities/hero_entity.dart';
import 'package:flutter/services.dart' show rootBundle;

import '../../../domain/usecase/usecase.dart';

class LoadHeroesJson implements LoadHeroes {
  @override
  Future<List<HeroEntity>> load() async {
    final String response =
        await rootBundle.loadString('assets/jsons/heroes.json');
    final responseDecode = json.decode(response);
    final data = responseDecode["heroes"] as List;
    final dataFormat = data.map((json) => Item.fromJson(json)).toList();
    return dataFormat
        .map((item) => HeroEntity(
              name: item.name,
              imageUrl: item.imageUrl,
              primaryWeapon: WeaponEntity(
                  name: item.primaryWeapon,
                  description: '',
                  imageUrl: '',
                  scalesWith: [],
                  upgradeWith: null),
              skill: null,
              ultimate: null,
            ))
        .toList();
  }
}

class Item {
  final String name;
  final String imageUrl;
  final String primaryWeapon;

  Item(
      {required this.name,
      required this.imageUrl,
      required this.primaryWeapon});

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      name: json['name'],
      imageUrl: json['imageUrl'],
      primaryWeapon: json['primaryWeapon'],
    );
  }
}
