import 'package:flutter/material.dart';

class FullScreenLoader extends StatelessWidget {
  const FullScreenLoader({super.key});

  Stream<String> getLoadingMessages() {
    final List<String> messages = [
      'Espere un momento...',
      'Pikachu está trabajando',
      'El profesor está en una investigación',
      'Mismgius está revisando el servidor',
      'Charizard viene en camino',
      'Esto está tardando un poco ⌛',
    ];
    return Stream.periodic(const Duration(seconds: 2), (int step) {
      return messages[step % messages.length];
    }).take(messages.length);
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Cargando...'),
            const SizedBox(height: 10),
            const CircularProgressIndicator(strokeWidth: 2),
            const SizedBox(height: 10),

            StreamBuilder(
              stream: getLoadingMessages(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return Text(
                    'Vamos...',
                    style: Theme.of(context).textTheme.titleLarge,
                  );
                }

                return Text(
                  snapshot.data!,
                  style: Theme.of(context).textTheme.titleLarge,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
