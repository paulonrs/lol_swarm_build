import 'package:flutter/material.dart';

import '../../domain/entities/entities.dart';

abstract class SelectPassivePresenter implements Listenable {
  void goToTela2Page();
  Future<List<PassiveEntity>> getPassives();
}
