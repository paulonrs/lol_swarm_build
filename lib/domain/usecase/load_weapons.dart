import 'package:equatable/equatable.dart';

import '../entities/entities.dart';

abstract class LoadWeapons {
  Future<List<WeaponEntity>> load();
}

class LoadWeaponsParams extends Equatable {
  @override
  List<Object?> get props => throw UnimplementedError();
}
