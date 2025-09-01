import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pkm_tcg_app/modules/tcg/domain/domain.dart';

import 'pokemon_set_repository_provider.dart';

// ! Provider
final pokemonOneSetProvider =
    StateNotifierProvider<PokemonSetNotifier, PokemonSetState>((ref) {
      final repository = ref.watch(pokemonSetRepositoryProvider);
      return PokemonSetNotifier(repository: repository);
    });

// ! State
class PokemonSetState {
  final bool isLoading;
  final int currentPage;
  final PokemonCardsSet? set;

  PokemonSetState({this.isLoading = false, this.currentPage = 1, this.set});

  PokemonSetState copyWith({
    bool? isLoading,
    int? currentPage,
    PokemonCardsSet? set,
  }) {
    return PokemonSetState(
      isLoading: isLoading ?? this.isLoading,
      currentPage: currentPage ?? this.currentPage,
      set: set ?? this.set,
    );
  }
}

// ! Notifier
class PokemonSetNotifier extends StateNotifier<PokemonSetState> {
  final PokemonCardsSetRepository repository;

  PokemonSetNotifier({required this.repository}) : super(PokemonSetState());

  Future<void> getSetById(String id) async {
    if (state.isLoading) return;

    state = state.copyWith(isLoading: true);
    // TODO: cambiar por el id
    final set = await repository.getPokemonSetById("sv10");

    if (set.cards.isEmpty) {
      state = state.copyWith(isLoading: false, set: null);
      return;
    }

    state = state.copyWith(
      isLoading: false,
      currentPage: state.currentPage + 1,
      set: set,
    );
  }
}
