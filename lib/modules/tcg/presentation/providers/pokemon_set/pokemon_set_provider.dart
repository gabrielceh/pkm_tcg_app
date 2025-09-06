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
  final PokemonCardsSet? set;

  PokemonSetState({this.isLoading = false, this.set});

  PokemonSetState copyWith({bool? isLoading, PokemonCardsSet? set}) {
    return PokemonSetState(
      isLoading: isLoading ?? this.isLoading,
      set: set ?? this.set,
    );
  }
}

// ! Notifier
class PokemonSetNotifier extends StateNotifier<PokemonSetState> {
  final PokemonCardsSetRepository repository;

  PokemonSetNotifier({required this.repository}) : super(PokemonSetState());

  Future<void> getSetById(String id) async {
    state = state.copyWith(set: null);

    if (state.isLoading) return;

    state = state.copyWith(isLoading: true, set: null);

    final set = await repository.getPokemonSetById(id);

    if (set.cards.isEmpty) {
      state = state.copyWith(isLoading: false, set: null);
      return;
    }

    state = state.copyWith(isLoading: false, set: set);
  }
}
