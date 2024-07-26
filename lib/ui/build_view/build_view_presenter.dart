import 'package:flutter/material.dart';

import '../../domain/entities/entities.dart';

abstract class BuildViewPresenter implements Listenable {
  void goToTela2Page();
  BuildEntity validateBuildArguments(arguments);
}
