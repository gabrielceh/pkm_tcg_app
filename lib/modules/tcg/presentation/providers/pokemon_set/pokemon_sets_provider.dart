import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pkm_tcg_app/modules/tcg/domain/domain.dart';

import 'pokemon_set_provider.dart';
import 'pokemon_set_repository_provider.dart';

// ! Provider
final pokemonSetsProvider =
    StateNotifierProvider<PokemonSetsNotifier, PokemonSetsState>((ref) {
      final repository = ref.watch(pokemonSetRepositoryProvider);
      final oneSetNotifier = ref.read(pokemonOneSetProvider.notifier);

      return PokemonSetsNotifier(
        repository: repository,
        oneSetNotifier: oneSetNotifier,
      );
    });

// ! State
class PokemonSetsState {
  final bool isLoading;
  final int currentPage;
  final List<PokemonCardsSet> sets;

  PokemonSetsState({
    this.isLoading = false,
    this.currentPage = 1,
    this.sets = const [],
  });

  PokemonSetsState copyWith({
    bool? isLoading,
    int? currentPage,
    List<PokemonCardsSet>? sets,
  }) {
    return PokemonSetsState(
      isLoading: isLoading ?? this.isLoading,
      currentPage: currentPage ?? this.currentPage,
      sets: sets ?? this.sets,
    );
  }
}

// ! Notifier
class PokemonSetsNotifier extends StateNotifier<PokemonSetsState> {
  final PokemonCardsSetRepository repository;
  final PokemonSetNotifier oneSetNotifier;

  PokemonSetsNotifier({required this.repository, required this.oneSetNotifier})
    : super(PokemonSetsState());

  Future<void> loadNextSets() async {
    if (state.isLoading) return;

    state = state.copyWith(isLoading: true);
    final sets = await repository.getPokemonSets(page: state.currentPage);

    if (sets.isEmpty) {
      state = state.copyWith(isLoading: false);
      return;
    }

    oneSetNotifier.getSetById(sets.first.id);

    state = state.copyWith(
      isLoading: false,
      currentPage: state.currentPage + 1,
      sets: [...state.sets, ...sets],
    );
  }
}
