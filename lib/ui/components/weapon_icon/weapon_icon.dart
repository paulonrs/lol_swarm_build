import 'package:flutter/material.dart';
import '../../../domain/entities/entities.dart';

class WeaponIcon extends StatefulWidget {
  final WeaponEntity? weapon;
  final Future<WeaponEntity?> Function(WeaponEntity?) onTapFunction;
  final bool disabled;

  const WeaponIcon({
    Key? key,
    this.weapon,
    this.disabled = false,
    this.onTapFunction = _defaultOnTapFunction,
  }) : super(key: key);

  static Future<WeaponEntity?> _defaultOnTapFunction(
      WeaponEntity? weapon) async {
    return weapon;
  }

  @override
  WeaponIconState createState() => WeaponIconState();
}

class WeaponIconState extends State<WeaponIcon> {
  late WeaponEntity? weapon;

  @override
  void initState() {
    super.initState();
    weapon = widget.weapon;
  }

  @override
  Widget build(BuildContext context) {
    String urlImg = weapon != null
        ? 'assets/images/weapons/${weapon!.imageUrl}'
        : 'assets/images/icons/select_area.png';
    String weaponName = weapon?.name ?? 'Select';
    if (weaponName.length > 12) {
      weaponName = '${weaponName.substring(0, 12)}...';
    }

    return GestureDetector(
      onTap: () async {
        final result = await widget.onTapFunction(weapon);
        if (result != null) {
          setState(() {
            weapon = result;
          });
        }
      },
      child: Padding(
        padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Container(
                width: 100.0,
                height: 100.0,
                color: const Color.fromARGB(15, 33, 33, 33),
                child: Image.asset(
                  urlImg,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 8.0),
            Text(
              weaponName,
              style: const TextStyle(fontSize: 16.0),
              maxLines: 1,
              overflow: TextOverflow.clip,
            ),
          ],
        ),
      ),
    );
  }
}
