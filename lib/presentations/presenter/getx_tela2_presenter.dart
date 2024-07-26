import 'package:get/get.dart';
import 'package:lol_swarm/infra/appRoutes/app_pages.dart';
import 'package:lol_swarm/ui/tela2/tela2.dart';

import '../../domain/entities/entities.dart';

class GetxTela2Presenter extends GetxController implements Tela2Presenter {
  @override
  void goToBuildViewPage() {
    Get.toNamed(AppRoutes.pageName(AppPages.buildView), arguments: getBuild());
  }

  @override
  void goToTela3Page() {
    Get.toNamed(AppRoutes.pageName(AppPages.tela3));
  }

  BuildEntity getBuild() {
    var hero = HeroEntity(
      name: 'Jinx',
      skill: const SkillEntity(
        name: "name1",
        description: "description1",
        imageUrl: "assets/images/Xayah.png",
      ),
      ultimate: const SkillEntity(
          name: "name2",
          description: "description2",
          imageUrl: "assets/images/Xayah.png"),
      primaryWeapon: WeaponEntity(
          name: 'Atk principal',
          description: 'description atk',
          imageUrl: 'assets/images/weapons/weapons_hero/xayah_weapon.png',
          upgradeWith: Passive.abilityHaste,
          scalesWith: [Passive.abilityHaste]),
      imageUrl: "xayah.png",
    );

    var weapons = [
      WeaponEntity(
          name: 'Statikk Sword',
          description: 'description',
          imageUrl: 'assets/images/weapons/Statikk Sword.png',
          upgradeWith: Passive.abilityHaste,
          scalesWith: [Passive.abilityHaste]),
      WeaponEntity(
          name: 'Statikk Sword',
          description: 'description',
          imageUrl: 'assets/images/weapons/Statikk Sword.png',
          upgradeWith: Passive.abilityHaste,
          scalesWith: [Passive.abilityHaste]),
      WeaponEntity(
          name: 'Statikk Sword',
          description: 'description',
          imageUrl: 'assets/images/weapons/Statikk Sword.png',
          upgradeWith: Passive.abilityHaste,
          scalesWith: [Passive.abilityHaste]),
      null
    ];

    List<PassiveEntity?> passives = [
      const PassiveEntity(name: "Damage", imageUrl: "Damage.png"),
      const PassiveEntity(name: "Damage", imageUrl: "Damage.png"),
      const PassiveEntity(name: "Damage", imageUrl: "Damage.png"),
      const PassiveEntity(name: "Damage", imageUrl: "Damage.png"),
      const PassiveEntity(name: "Damage", imageUrl: "Damage.png"),
      null,
    ];

    var build = BuildEntity(
        name: "Build teste 1",
        hero: hero,
        weapons: weapons,
        passives: passives);

    return build;
  }
}
