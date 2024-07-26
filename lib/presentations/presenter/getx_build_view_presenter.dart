import 'package:get/get.dart';
import 'package:lol_swarm/domain/entities/hero_entity.dart';
import 'package:lol_swarm/infra/appRoutes/app_pages.dart';
import 'package:lol_swarm/ui/build_view/build_view.dart';

class GetxBuildViewPresenter extends GetxController
    implements BuildViewPresenter {
  @override
  void goToTela2Page() {
    Get.toNamed(AppRoutes.pageName(AppPages.tela2));
  }

  BuildEntity getBuildEmpty() {
    const build = BuildEntity(
        name: "New Build", hero: null, weapons: [null], passives: [null]);

    return build;
  }

  @override
  BuildEntity validateBuildArguments(arguments) {
    if (arguments == null || arguments is! BuildEntity) {
      return getBuildEmpty();
    }

    return arguments;
  }
}
