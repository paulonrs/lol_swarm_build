import 'package:flutter/material.dart';

import 'package:lol_swarm/ui/build_view/build_view_page.dart';

import 'build_view_presenter_factory.dart';

Widget makeBuildViewPage() {
  return BuildViewPage(
    presenter: makeGetxBuildViewPresenter(),
  );
}
