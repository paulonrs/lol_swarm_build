import 'package:flutter/material.dart';
import '../../../../ui/ui.dart';
import 'select_weapon.dart';

Widget makeSelectWeaponPage() {
  return SelectWeaponPage(
    presenter: makeGetxSelectWeaponPresenter(),
  );
}
