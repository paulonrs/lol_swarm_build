import 'package:flutter/material.dart';

import '../../../domain/entities/entities.dart';

class PassiveIconList extends StatelessWidget {
  final PassiveEntity passive;

  const PassiveIconList({super.key, required this.passive});

  @override
  Widget build(BuildContext context) {
    String urlImg = "assets/images/passives/${passive.imageUrl}";
    return Padding(
      padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Container(
              width: 40.0,
              height: 40.0,
              color: const Color.fromARGB(255, 25, 25, 55),
              child: Image(
                image: AssetImage(urlImg),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
