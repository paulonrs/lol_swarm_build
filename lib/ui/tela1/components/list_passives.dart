import 'package:flutter/material.dart';

import '../../../domain/entities/entities.dart';
import '../../components/components.dart';

class ListPassives extends StatelessWidget {
  final List<PassiveEntity?> passives;
  const ListPassives({super.key, required this.passives});

  @override
  Widget build(BuildContext context) {
    List<PassiveEntity?> mutablePassives = List.from(passives);
    if (mutablePassives.length < 6) {
      for (var i = mutablePassives.length; i < 6; i++) {
        mutablePassives.add(null);
      }
    }

    return Wrap(
      children: mutablePassives.map((passive) {
        return PassiveIcon(passive: passive);
      }).toList(),
    );
  }
}
