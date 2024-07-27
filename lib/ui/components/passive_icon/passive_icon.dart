import 'package:flutter/material.dart';

import '../../../domain/entities/entities.dart';

class PassiveIcon extends StatelessWidget {
  final PassiveEntity? passive;
  final Future<PassiveEntity?> Function(PassiveEntity?) onTapFunction;

  const PassiveIcon(
      {super.key, this.passive, this.onTapFunction = _defaultOnTapFunction});

  static Future<PassiveEntity?> _defaultOnTapFunction(
      PassiveEntity? passive) async {
    return passive;
  }

  @override
  Widget build(BuildContext context) {
    PassiveEntity? passive = this.passive;
    String urlImg = passive != null
        ? "assets/images/passives/${passive.imageUrl}"
        : "assets/images/icons/select_area.png";
    return GestureDetector(
      onTap: () async {
        final result = await onTapFunction(passive);
        if (result != null) {
          passive = result;
        }
      },
      child: Padding(
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
      ),
    );
  }
}
