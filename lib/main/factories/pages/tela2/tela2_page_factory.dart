import 'package:flutter/material.dart';
import 'package:lol_swarm/ui/tela2/tela2_page.dart';

import 'tela2_presenter_factory.dart';

Widget makeTela2Page() {
  return Tela2Page(
    presenter: makeGetxTela2Presenter(),
  );
}
