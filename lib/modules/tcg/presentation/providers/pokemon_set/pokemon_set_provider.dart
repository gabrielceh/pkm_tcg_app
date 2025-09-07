import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pkm_tcg_app/modules/tcg/domain/domain.dart';

import 'pokemon_set_repository_provider.dart';

// ! Provider
final pokemonOneSetProvider =
    StateNotifierProvider.autoDispose<PokemonSetNotifier, PokemonSetState>((
      ref,
    ) {
      final repository = ref.watch(pokemonSetRepositoryProvider);
      return PokemonSetNotifier(repository: repository);
    });

// ! State
class PokemonSetState {
  final bool isLoading;
  final Map<String, PokemonCardsSet?> sets;

  PokemonSetState({this.isLoading = false, this.sets = const {}});

  PokemonSetState copyWith({
    bool? isLoading,
    Map<String, PokemonCardsSet?>? sets,
  }) {
    return PokemonSetState(
      isLoading: isLoading ?? this.isLoading,
      sets: sets ?? this.sets,
    );
  }
}

// ! Notifier
class PokemonSetNotifier extends StateNotifier<PokemonSetState> {
  final PokemonCardsSetRepository repository;

  PokemonSetNotifier({required this.repository}) : super(PokemonSetState());

  Future<void> getSetById(String id) async {
    if (state.sets[id] != null) return;

    if (state.isLoading) return;

    state = state.copyWith(isLoading: true);

    final set = await repository.getPokemonSetById(id);

    if (set.id.isEmpty) {
      state = state.copyWith(isLoading: false, sets: {...state.sets, id: null});
      return;
    }

    state = state.copyWith(isLoading: false, sets: {...state.sets, id: set});
  }
}
