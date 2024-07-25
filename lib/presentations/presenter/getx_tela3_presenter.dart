import 'package:get/get.dart';
import 'package:lol_swarm/domain/entities/hero_entity.dart';
import 'package:lol_swarm/domain/usecase/load_heroes.dart';

import '../../infra/appRoutes/app_pages.dart';
import '../../ui/tela3/tela3_presenter.dart';

class GetxTela3Presenter extends GetxController implements Tela3Presenter {
  final LoadHeroes loadHeroes;

  GetxTela3Presenter({required this.loadHeroes});

  @override
  void goToTela2Page() {
    Get.toNamed(AppRoutes.pageName(AppPages.tela2));
  }

  @override
  Future<List<HeroEntity>> getHeroes() async {
    return await loadHeroes.load();
  }
}
