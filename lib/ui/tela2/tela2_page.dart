import 'package:flutter/material.dart';
import 'package:lol_swarm/ui/tela2/tela2.dart';
import 'package:provider/provider.dart';

class Tela2Page extends StatelessWidget {
  final Tela2Presenter presenter;

  const Tela2Page({super.key, required this.presenter});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Builder(
      builder: (context) {
        return Scaffold(
          appBar: AppBar(title: const Text('Tela 2')),
          body: Center(
            child: Column(
              children: [
                ListenableProvider(
                    create: (_) => presenter,
                    child: const Column(
                      children: [
                        InputGoTela3(),
                      ],
                    )),
                ElevatedButton(
                  onPressed: presenter.goToTela1Page,
                  child: const Text('Voltar para Tela 1'),
                ),
              ],
            ),
          ),
        );
      },
    ));
  }
}
