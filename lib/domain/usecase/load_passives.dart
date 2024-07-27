import 'package:equatable/equatable.dart';

import '../entities/entities.dart';

abstract class LoadPassives {
  Future<List<PassiveEntity>> load();
}

class LoadPassivesParams extends Equatable {
  @override
  List<Object?> get props => throw UnimplementedError();
}
