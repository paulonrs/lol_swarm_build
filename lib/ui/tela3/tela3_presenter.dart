import 'package:flutter/material.dart';

import '../../domain/entities/entities.dart';

abstract class Tela3Presenter implements Listenable {
  void goToTela2Page();
  Future<List<HeroEntity>> getHeroes();
}
