import 'package:flutter/material.dart';

import '../../domain/entities/entities.dart';

abstract class Tela1Presenter implements Listenable {
  void goToTela2Page();
  // BuildEntity getBuild();
  BuildEntity validateBuildArguments(arguments);
}
