import 'package:lol_swarm/presentations/presentations.dart';
import '../../../../ui/ui.dart';
import '../../factories.dart';

SelectPassivePresenter makeGetxSelectPassivePresenter() =>
    GetxSelectPassivePresenter(loadPassives: makeLocalLoadPassives());
