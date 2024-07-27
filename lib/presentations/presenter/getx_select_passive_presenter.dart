import 'package:get/get.dart';

import '../../domain/entities/entities.dart';
import '../../domain/usecase/usecase.dart';
import '../../infra/appRoutes/app_pages.dart';
import '../../ui/ui.dart';

class GetxSelectPassivePresenter extends GetxController
    implements SelectPassivePresenter {
  final LoadPassives loadPassives;

  GetxSelectPassivePresenter({required this.loadPassives});

  @override
  void goToTela2Page() {
    Get.toNamed(AppRoutes.pageName(AppPages.tela2));
  }

  @override
  Future<List<PassiveEntity>> getPassives() async {
    return await loadPassives.load();
  }
}
