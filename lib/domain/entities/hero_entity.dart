import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class HeroEntity extends Equatable {
  final String name;
  final SkillEntity? skill;
  final SkillEntity? ultimate;
  final WeaponEntity primaryWeapon;
  final String imageUrl;

  const HeroEntity({
    required this.name,
    required this.skill,
    required this.ultimate,
    required this.primaryWeapon,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [
        name,
        skill,
        ultimate,
        primaryWeapon,
      ];
}

class WeaponEntity {
  final String? name;
  final String? description;
  final String? imageUrl;
  final Passive? upgradeWith;
  final List<Passive?> scalesWith;

  WeaponEntity(
      {required this.name,
      required this.description,
      required this.imageUrl,
      required this.upgradeWith,
      required this.scalesWith});
}

enum Passive {
  abilityHaste,
  areaSize,
  armor,
  criticalChance,
  damage,
  exp,
  healthRegen,
  maxHealth,
  moveSpeed,
  pickupRadius,
  duration,
  projectileCount;

  static Passive? fromString(String value) {
    debugPrint('value: $value');
    return Passive.values.firstWhere(
      (e) => e.toString().split('.').last == value,
      orElse: () => throw Exception('Passive not found'),
    );
  }
}

class SkillEntity {
  final String name;
  final String description;
  final String imageUrl;

  const SkillEntity({
    required this.name,
    required this.description,
    required this.imageUrl,
  });
}

class PassiveEntity {
  final String name;
  final String imageUrl;

  const PassiveEntity({
    required this.name,
    required this.imageUrl,
  });
}

class BuildEntity {
  final String? name;
  final HeroEntity? hero;
  final List<WeaponEntity?> weapons;
  final List<PassiveEntity?> passives;

  const BuildEntity({
    required this.name,
    required this.hero,
    required this.weapons,
    required this.passives,
  });
}
