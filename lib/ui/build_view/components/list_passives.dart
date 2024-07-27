import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../domain/entities/entities.dart';
import '../../../infra/appRoutes/app_routes.dart';
import '../../components/components.dart';

class ListPassives extends StatefulWidget {
  final List<PassiveEntity?> passives;
  const ListPassives({super.key, required this.passives});

  @override
  ListPassivesState createState() => ListPassivesState();
}

class ListPassivesState extends State<ListPassives> {
  late List<PassiveEntity?> passives;
  late List<PassiveEntity?> mutablePassives;
  late PassiveEntity? passive;

  @override
  void initState() {
    super.initState();
    passives = widget.passives;

    mutablePassives = List.from(passives);
    if (mutablePassives.length < 6) {
      for (var i = mutablePassives.length; i < 6; i++) {
        mutablePassives.add(null);
      }
    }
  }

  Future<PassiveEntity?> handlePassiveTap(PassiveEntity? tappedPassive) async {
    final result = await Get.toNamed(AppRoutes.pageName(AppPages.selectPassive),
        arguments: tappedPassive);
    if (result != null && result is PassiveEntity) {
      setState(() {
        int index = mutablePassives.indexOf(tappedPassive);
        if (index != -1) {
          mutablePassives[index] = result;
        }
        passive = result;
      });
      return passive;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return GridView(
      shrinkWrap: true,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 0.0,
        mainAxisSpacing: 0.0,
        childAspectRatio: 3.5,
      ),
      children: mutablePassives.map((passive) {
        return PassiveIcon(
          passive: passive,
          onTapFunction: handlePassiveTap,
        );
      }).toList(),
    );
  }
}
