import 'package:flutter/material.dart';

import '../../../domain/entities/entities.dart';
import 'componets.dart';

class TableWithFixedHeader extends StatelessWidget {
  final List<WeaponEntity> weapons;
  final Future<WeaponEntity?> Function(WeaponEntity?) onTapFunction;

  const TableWithFixedHeader(
      {super.key, required this.weapons, required this.onTapFunction});

  @override
  Widget build(BuildContext context) {
    const String urlImgFolder = "assets/images/weapons/";

    return Column(
      children: [
        Container(
          color: const Color.fromARGB(255, 255, 255, 255),
          child: const Row(
            children: [
              Expanded(
                  child: Text('',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold))),
              Expanded(
                  child: Text('Scale With',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold))),
              Expanded(
                  child: Text('Upgrade With',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold))),
            ],
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                ...weapons
                    .map((weapon) => Column(
                          children: [
                            GestureDetector(
                              onTap: () async {
                                final result = await onTapFunction(weapon);
                                if (result != null) {
                                  debugPrint('result: $result');
                                }
                              },
                              child: Row(
                                children: [
                                  Expanded(
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8.0),
                                      child: Image(
                                        width: 100,
                                        height: 100,
                                        image: AssetImage(urlImgFolder +
                                            weapon.imageUrl.toString()),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          ...List.generate(
                                              (weapon.scalesWith.length / 2)
                                                  .ceil(), (index) {
                                            int startIndex = index * 2;
                                            int endIndex = (index * 2 + 1) <
                                                    weapon.scalesWith.length
                                                ? index * 2 + 1
                                                : startIndex;
                                            List passivePair = weapon.scalesWith
                                                .sublist(
                                                    startIndex, endIndex + 1);

                                            return Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children:
                                                  passivePair.map((passive) {
                                                return PassiveIconList(
                                                  passive: PassiveEntity(
                                                    name: passive!.getName,
                                                    imageUrl:
                                                        '${passive.getName}.png',
                                                  ),
                                                );
                                              }).toList(),
                                            );
                                          }),
                                          const SizedBox(height: 8.0),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                      child: Center(
                                    child: PassiveIconList(
                                        passive: PassiveEntity(
                                            name: weapon.upgradeWith!.getName,
                                            imageUrl:
                                                '${weapon.upgradeWith!.getName}.png')),
                                  )),
                                ],
                              ),
                            ),
                          ],
                        ))
                    .toList(),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
