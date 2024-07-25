import 'package:equatable/equatable.dart';

import '../entities/entities.dart';

abstract class LoadHeroes {
  Future<List<HeroEntity>> load();
}

class LoadHeroeosParams extends Equatable {
  @override
  List<Object?> get props => throw UnimplementedError();
}
