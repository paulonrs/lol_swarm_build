import 'package:get/get.dart';
import 'package:lol_swarm/domain/entities/entities.dart';
import 'package:lol_swarm/domain/usecase/load_heroes.dart';

import '../../infra/appRoutes/app_pages.dart';
import '../../ui/select_hero/select_hero.dart';

class GetxSelectHeroPresenter extends GetxController
    implements SelectHeroPresenter {
  final LoadHeroes loadHeroes;

  GetxSelectHeroPresenter({required this.loadHeroes});

  @override
  void goToTela2Page() {
    Get.toNamed(AppRoutes.pageName(AppPages.tela2));
  }

  @override
  Future<List<HeroEntity>> getHeroes() async {
    return await loadHeroes.load();
  }
}
