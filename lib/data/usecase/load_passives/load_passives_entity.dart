import 'package:lol_swarm/domain/entities/hero_entity.dart';

import '../../../domain/usecase/usecase.dart';

class LoadPassivesEntity implements LoadPassives {
  @override
  Future<List<PassiveEntity>> load() async {
    List<Passive> allPassivesEnum = Passive.values;

    return allPassivesEnum
        .map((e) => PassiveEntity(
              name: e.getName,
              imageUrl: '${e.getName}.png',
            ))
        .toList();
  }
}
