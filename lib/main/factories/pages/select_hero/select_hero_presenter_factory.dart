import 'package:lol_swarm/main/factories/factories.dart';
import 'package:lol_swarm/presentations/presentations.dart';
import '../../../../ui/ui.dart';

SelectHeroPresenter makeGetxSelectHeroPresenter() =>
    GetxSelectHeroPresenter(loadHeroes: makeLocalLoadHeroes());
