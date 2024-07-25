import 'package:lol_swarm/main/factories/factories.dart';
import 'package:lol_swarm/presentations/presentations.dart';
import '../../../../ui/ui.dart';

Tela3Presenter makeGetxTela3Presenter() =>
    GetxTela3Presenter(loadHeroes: makeLocalLoadHeroes());
