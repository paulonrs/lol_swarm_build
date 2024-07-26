import 'package:get/get.dart';
import 'package:lol_swarm/domain/entities/hero_entity.dart';

import '../../domain/usecase/usecase.dart';
import '../../ui/ui.dart';

class GetxSelectWeaponPresenter extends GetxController
    implements SelectWeaponPresenter {
  final LoadWeapons loadWeapons;

  GetxSelectWeaponPresenter({required this.loadWeapons});

  @override
  Future<List<WeaponEntity>> getWeapons() {
    return loadWeapons.load();
  }
}
