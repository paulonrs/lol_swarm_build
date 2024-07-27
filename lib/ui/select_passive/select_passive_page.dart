import 'package:flutter/material.dart';
import '../../domain/entities/entities.dart';
import '../components/components.dart';
import 'select_passive_presenter.dart';

class SelectPassivePage extends StatelessWidget {
  final SelectPassivePresenter presenter;
  const SelectPassivePage({super.key, required this.presenter});

  Future<List<PassiveEntity>> fetchPassives() async {
    return await presenter.getPassives();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<List<PassiveEntity>>(
      future: fetchPassives(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text('Error'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('Error'));
        }

        final List<PassiveEntity> passives = snapshot.data!;
        return Scaffold(
          appBar: AppBar(title: const Text('Tela 3')),
          body: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 0.0,
              mainAxisSpacing: 0.0,
              childAspectRatio: 2.5,
            ),
            itemCount: passives.length,
            itemBuilder: (context, index) {
              final passive = passives[index];
              return PassiveIcon(
                  passive: passive,
                  onTapFunction: (passive) async {
                    Navigator.pop(context, passive);
                    return null;
                  });
            },
          ),
        );
      },
    ));
  }
}
