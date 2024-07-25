import 'package:flutter/material.dart';

import 'package:lol_swarm/ui/tela1/tela1_page.dart';

import 'tela1_presenter_factory.dart';

Widget makeTela1Page() {
  return Tela1Page(
    presenter: makeGetxTela1Presenter(),
  );
}
