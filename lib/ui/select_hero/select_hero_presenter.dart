import 'package:flutter/material.dart';

import '../../domain/entities/entities.dart';

abstract class SelectHeroPresenter implements Listenable {
  void goToTela2Page();
  Future<List<HeroEntity>> getHeroes();
}
