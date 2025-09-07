import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pkm_tcg_app/modules/tcg/presentation/providers/pokemon_set/pokemon_set_provider.dart';
import 'package:pkm_tcg_app/modules/tcg/presentation/providers/pokemon_set/pokemon_sets_provider.dart';

final initialLoadingProvider = Provider<bool>((ref) {
  final step1 = ref.watch(pokemonSetsProvider).sets.isEmpty;
  final step2 = ref.watch(pokemonOneSetProvider).isLoading;

  if (step1 || step2) return true;

  return false;
});
