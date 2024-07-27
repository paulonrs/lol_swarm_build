import 'package:flutter/material.dart';
import 'package:lol_swarm/ui/select_weapon/components/table_with_fixed_header.dart';
import '../../domain/entities/entities.dart';
import 'select_weapon_presenter.dart';

class SelectWeaponPage extends StatelessWidget {
  final SelectWeaponPresenter presenter;
  const SelectWeaponPage({super.key, required this.presenter});

  Future<List<WeaponEntity>> fetchWeapons() async {
    return await presenter.getWeapons();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<List<WeaponEntity>>(
      future: fetchWeapons(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text('Error'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('Error'));
        }

        final List<WeaponEntity> weapons = snapshot.data!;
        return Scaffold(
            appBar: AppBar(title: const Text('Select Weapon')),
            body: TableWithFixedHeader(weapons: weapons));
      },
    ));
  }
}
