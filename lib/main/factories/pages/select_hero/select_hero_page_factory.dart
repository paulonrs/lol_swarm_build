import 'package:flutter/material.dart';
import '../../../../ui/ui.dart';
import 'select_hero.dart';

Widget makeSelectHeroPage() {
  return SelectHeroPage(
    presenter: makeGetxSelectHeroPresenter(),
  );
}
