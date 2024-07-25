import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:lol_swarm/ui/tela1/tela1.dart';

import '../../domain/entities/entities.dart';
import 'components/components.dart';

class Tela1Page extends StatelessWidget {
  final Tela1Presenter presenter;
  const Tela1Page({super.key, required this.presenter});

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
              ListWeapons(weapons: build.weapons),
              ListPassives(passives: build.passives),
            ],
          ),
        ));
  }
}
