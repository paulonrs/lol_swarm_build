import 'package:flutter/material.dart';
import '../../../../ui/ui.dart';
import 'select_passive.dart';

Widget makeSelectPassivePage() {
  return SelectPassivePage(
    presenter: makeGetxSelectPassivePresenter(),
  );
}
