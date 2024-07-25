import 'package:lol_swarm/data/usecase/load_heroes.dart/load_heroes_json.dart';

import '../../../domain/usecase/usecase.dart';

LoadHeroes makeLocalLoadHeroes() => LoadHeroesJson();
