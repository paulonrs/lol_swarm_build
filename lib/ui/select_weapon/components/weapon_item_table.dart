import 'package:flutter/material.dart';

import '../../../domain/entities/entities.dart';
import 'componets.dart';

class WeaponItemTable extends StatelessWidget {
  final WeaponEntity weapon;
  final Future<WeaponEntity?> Function(WeaponEntity?) onTapFunction;

  const WeaponItemTable(
      {super.key, required this.weapon, required this.onTapFunction});

  @override
  Widget build(BuildContext context) {
    const String urlImgFolder = "assets/images/weapons/";

    return GestureDetector(
        onTap: () async {
          final result = await onTapFunction(weapon);
          if (result != null) {
            debugPrint('result: $result');
          }
        },
        child: Column(
          children: [
            Text(
              weapon.name.toString(),
              style: const TextStyle(fontSize: 20.0),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Container(
                    width: 80.0,
                    height: 80.0,
                    color: const Color.fromARGB(15, 33, 33, 33),
                    child: Image(
                      image:
                          AssetImage(urlImgFolder + weapon.imageUrl.toString()),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ...List.generate((weapon.scalesWith.length / 2).ceil(),
                        (index) {
                      int startIndex = index * 2;
                      int endIndex = (index * 2 + 1) < weapon.scalesWith.length
                          ? index * 2 + 1
                          : startIndex;
                      List passivePair =
                          weapon.scalesWith.sublist(startIndex, endIndex + 1);

                      return Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: passivePair.map((passive) {
                          return PassiveIconList(
                            passive: PassiveEntity(
                              name: passive!.getName,
                              imageUrl: '${passive.getName}.png',
                            ),
                          );
                        }).toList(),
                      );
                    }),
                    const SizedBox(height: 8.0),
                  ],
                ),
                PassiveIconList(
                    passive: PassiveEntity(
                        name: weapon.upgradeWith!.getName,
                        imageUrl: '${weapon.upgradeWith!.getName}.png'))
              ],
            ),
          ],
        )
        // child: Padding(
        //   padding: const EdgeInsets.all(8.0),
        //   child: Column(
        //     mainAxisSize: MainAxisSize.min,
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     children: [
        //       const SizedBox(height: 8.0),
        //       Text(
        //         weapon.name.toString(),
        //         style: const TextStyle(fontSize: 16.0),
        //       ),
        //       Row(
        //         children: [

        // const SizedBox(width: 8.0),
        // Expanded(
        //   child: GridView.builder(
        //     gridDelegate:
        //         const SliverGridDelegateWithFixedCrossAxisCount(
        //       crossAxisCount: 3,
        //       crossAxisSpacing: 0.0,
        //       mainAxisSpacing: 0.0,
        //       childAspectRatio: 1,
        //     ),
        //     itemBuilder: (BuildContext context, int index) {
        //       return PassiveIconList(
        //           passive: PassiveEntity(
        //               name: weapon.scalesWith[index]!.getName,
        //               imageUrl:
        //                   '${weapon.scalesWith[index]!.getName}.png'));
        //     },
        //   ),
        // ),
        // Column(
        //   children: [
        //     Text(
        //       weapon.upgradeWith.toString(),
        //       style: const TextStyle(fontSize: 12.0),
        //     ),
        //   ],
        // )
        //           ],
        //         ),
        //       ],
        //     ),
        //   ),
        );
  }
}
