import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pkm_tcg_app/modules/shared/presentation/widgets/widgets.dart';
import 'package:pkm_tcg_app/modules/tcg/presentation/providers/providers.dart';
import 'package:pkm_tcg_app/modules/tcg/presentation/widgets/widgets.dart';

class SetsScreen extends ConsumerStatefulWidget {
  const SetsScreen({super.key});

  @override
  SetsScreenState createState() => SetsScreenState();
}

class SetsScreenState extends ConsumerState<SetsScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(
      () => ref.read(pokemonAllSetsProvidder.notifier).loadNext(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final setsState = ref.watch(pokemonAllSetsProvidder);

    if (setsState.sets.isEmpty) return Scaffold(body: const FullScreenLoader());

    return Scaffold(
      appBar: AppBar(title: Text('Sets')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListSets(
          sets: setsState.sets,
          loadNextPage: () {
            ref.read(pokemonAllSetsProvidder.notifier).loadNext();
          },
        ),
      ),
    );
  }
}
