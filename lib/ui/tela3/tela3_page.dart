import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../domain/entities/entities.dart';
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
              crossAxisCount: 3,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
            ),
            itemCount: heroes.length,
            itemBuilder: (context, index) {
              final hero = heroes[index];
              return GestureDetector(
                onTap: () {
                  Navigator.pop(context, hero);
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Expanded(
                      child: Image.network(
                        hero.imageUrl,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      hero.name,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 18.0),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    ));
  }
}
