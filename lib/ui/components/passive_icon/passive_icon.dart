import 'package:flutter/material.dart';

import '../../../domain/entities/entities.dart';

class PassiveIcon extends StatelessWidget {
  final PassiveEntity? passive;

  const PassiveIcon({super.key, this.passive});

  @override
  Widget build(BuildContext context) {
    String urlImg = passive != null
        ? "assets/images/passives/${passive!.imageUrl}"
        : "assets/images/icons/select_area.png";
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
              color: passive != null
                  ? const Color.fromARGB(255, 25, 25, 55)
                  : const Color.fromARGB(15, 33, 33, 33),
              child: Image(
                image: AssetImage(urlImg),
              ),
            ),
          ),
          const SizedBox(width: 4),
          Text(
            passive?.name ?? 'Select',
            style: const TextStyle(fontSize: 16.0),
          ),
        ],
      ),
    );
  }
}
