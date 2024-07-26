import 'package:flutter/material.dart';
import '../../domain/entities/entities.dart';
import '../components/components.dart';
import 'tela3_presenter.dart';

class Tela3Page extends StatelessWidget {
  final Tela3Presenter presenter;
  const Tela3Page({super.key, required this.presenter});

  Future<List<HeroEntity>> fetchHeroes() async {
    return await presenter.getHeroes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<List<HeroEntity>>(
      future: fetchHeroes(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return const Center(child: Text('Erro ao carregar dados'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return const Center(child: Text('Nenhum herói encontrado'));
        }

        final List<HeroEntity> heroes = snapshot.data!;
        return Scaffold(
          appBar: AppBar(title: const Text('Tela 3')),
          body: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 0.0,
              mainAxisSpacing: 0.0,
              childAspectRatio: 1.3,
            ),
            itemCount: heroes.length,
            itemBuilder: (context, index) {
              final hero = heroes[index];
              return HeroIcon(
                  hero: hero,
                  onTapFunction: (hero) async {
                    Navigator.pop(context, hero);
                    return null;
                  });
            },
          ),
        );
      },
    ));
  }
}
