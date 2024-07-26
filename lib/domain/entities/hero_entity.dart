import 'package:equatable/equatable.dart';

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
    return Passive.values.firstWhere(
      (e) => e.toString().split('.').last == value,
      orElse: () => throw Exception('Passive not found'),
    );
  }

  String get getName {
    switch (this) {
      case Passive.abilityHaste:
        return 'Ability Haste';
      case Passive.areaSize:
        return 'Area Size';
      case Passive.armor:
        return 'Armor';
      case Passive.criticalChance:
        return 'Critical Chance';
      case Passive.damage:
        return 'Damage';
      case Passive.exp:
        return 'EXP';
      case Passive.healthRegen:
        return 'Health Regen';
      case Passive.maxHealth:
        return 'Max Health';
      case Passive.moveSpeed:
        return 'Move Speed';
      case Passive.pickupRadius:
        return 'Pickup Radius';
      case Passive.duration:
        return 'Duration';
      case Passive.projectileCount:
        return 'Projectile Count';
      default:
        return toString().split('.').last;
    }
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
