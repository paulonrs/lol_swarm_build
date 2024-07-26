import 'package:lol_swarm/presentations/presentations.dart';
import '../../../../ui/ui.dart';
import '../../factories.dart';

SelectWeaponPresenter makeGetxSelectWeaponPresenter() =>
    GetxSelectWeaponPresenter(loadWeapons: makeLocalLoadWeapons());
