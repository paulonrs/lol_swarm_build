import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:lol_swarm/ui/build_view/build_view.dart';

import '../../domain/entities/entities.dart';
import 'components/components.dart';

class BuildViewPage extends StatelessWidget {
  final BuildViewPresenter presenter;
  const BuildViewPage({super.key, required this.presenter});

  @override
  Widget build(BuildContext context) {
    var arguments = Get.arguments;
    presenter.validateBuildArguments(arguments);
    BuildEntity build = presenter.validateBuildArguments(arguments);
    return Scaffold(
        appBar: AppBar(title: const Text('Tela 1')),
        body: SingleChildScrollView(
          child: Column(
            children: [
              RowHero(hero: build.hero),
              ListWeapons(
                weapons: build.weapons,
              ),
              ListPassives(passives: build.passives),
            ],
          ),
        ));
  }
}
