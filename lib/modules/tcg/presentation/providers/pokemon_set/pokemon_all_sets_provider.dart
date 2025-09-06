import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pkm_tcg_app/modules/tcg/domain/domain.dart';
import 'package:pkm_tcg_app/modules/tcg/presentation/providers/providers.dart';

final pokemonAllSetsProvidder =
    StateNotifierProvider<PokemonAllSetsNotifier, PokemonAllSetsState>((ref) {
      final repository = ref.watch(pokemonSetRepositoryProvider);

      return PokemonAllSetsNotifier(repository: repository);
    });

// ! State
class PokemonAllSetsState {
  final bool isLoading;
  final int currentPage;
  final List<PokemonCardsSet> sets;

  PokemonAllSetsState({
    this.isLoading = false,
    this.currentPage = 1,
    this.sets = const [],
  });

  PokemonAllSetsState copyWith({
    bool? isLoading,
    int? currentPage,
    List<PokemonCardsSet>? sets,
  }) {
    return PokemonAllSetsState(
      isLoading: isLoading ?? this.isLoading,
      currentPage: currentPage ?? this.currentPage,
      sets: sets ?? this.sets,
    );
  }
}

class PokemonAllSetsNotifier extends StateNotifier<PokemonAllSetsState> {
  final PokemonCardsSetRepository repository;

  PokemonAllSetsNotifier({required this.repository})
    : super(PokemonAllSetsState());

  Future<void> loadNext() async {
    if (state.isLoading) return;

    state = state.copyWith(isLoading: true);
    final sets = await repository.getPokemonSets(page: state.currentPage);

    if (sets.isEmpty) {
      state = state.copyWith(isLoading: false);
      return;
    }

    state = state.copyWith(
      isLoading: false,
      currentPage: state.currentPage + 1,
      sets: [...state.sets, ...sets],
    );
  }
}
