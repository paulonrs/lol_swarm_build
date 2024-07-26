import 'package:flutter/material.dart';
import 'package:lol_swarm/ui/tela2/tela2.dart';
import 'package:provider/provider.dart';

class InputGoSelectHero extends StatelessWidget {
  const InputGoSelectHero({super.key});

  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<Tela2Presenter>(context);
    return StreamBuilder(
      builder: (context, snapshot) {
        return ElevatedButton(
          onPressed: presenter.goToSelectHeroPage,
          child: const Text('Ir para Tela 3'),
        );
      },
    );
  }
}
