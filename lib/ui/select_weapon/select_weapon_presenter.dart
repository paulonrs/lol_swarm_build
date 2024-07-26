import 'package:flutter/material.dart';

import '../../domain/entities/entities.dart';

abstract class SelectWeaponPresenter implements Listenable {
  Future<List<WeaponEntity>> getWeapons();
}
