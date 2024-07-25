import 'package:flutter/material.dart';
import 'package:lol_swarm/ui/tela2/tela2.dart';
import 'package:provider/provider.dart';

class InputGoTela3 extends StatelessWidget {
  const InputGoTela3({super.key});

  @override
  Widget build(BuildContext context) {
    final presenter = Provider.of<Tela2Presenter>(context);
    return StreamBuilder(
      builder: (context, snapshot) {
        return ElevatedButton(
          onPressed: presenter.goToTela3Page,
          child: const Text('Ir para Tela 3'),
        );
      },
    );
  }
}
