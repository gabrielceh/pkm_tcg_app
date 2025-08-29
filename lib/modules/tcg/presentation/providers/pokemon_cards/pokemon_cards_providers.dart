import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pkm_tcg_app/modules/tcg/domain/domain.dart';

import 'pokemon_cards_repository_provider.dart';

// ! Provider
final pokemonCardsProvider =
    StateNotifierProvider<PokemonCardsNotifier, PokemonCardsState>((ref) {
      final repository = ref.watch(pokemonCardsRepositoryProvider);
      return PokemonCardsNotifier(repository: repository);
    });

// ! State
class PokemonCardsState {
  final bool isLoading;
  final int currentPage;
  final List<PokemonCard> cards;
  final int totalCount;
  final int currentCount;

  PokemonCardsState({
    this.isLoading = false,
    this.currentPage = 1,
    this.totalCount = 0,
    this.currentCount = 0,
    this.cards = const [],
  });

  PokemonCardsState copyWith({
    bool? isLoading,
    int? currentPage,
    List<PokemonCard>? cards,
    int? totalCount,
    int? currentCount,
  }) {
    return PokemonCardsState(
      isLoading: isLoading ?? this.isLoading,
      currentPage: currentPage ?? this.currentPage,
      totalCount: totalCount ?? this.totalCount,
      currentCount: currentCount ?? this.currentCount,
      cards: cards ?? this.cards,
    );
  }
}

// ! Notifier
class PokemonCardsNotifier extends StateNotifier<PokemonCardsState> {
  final PokemonCardsRepository repository;

  PokemonCardsNotifier({required this.repository}) : super(PokemonCardsState());

  Future<void> loadNextCards() async {
    if (state.isLoading) return;
    if (state.totalCount > 0 && state.currentPage >= state.totalCount) return;

    state = state.copyWith(isLoading: true);
    // final paginatedCards = await repository.getPokemonCards(
    //   page: state.currentPage,
    // );

    // print(paginatedCards.cards);
    // if (paginatedCards.cards.isEmpty) {
    //   state = state.copyWith(isLoading: false);
    //   return;
    // }

    state = state.copyWith(
      isLoading: false,
      currentPage: state.currentPage + 1,
      // cards: [...state.cards, ...[]],
      // totalCount: paginatedCards.totalCount,
      // currentCount: paginatedCards.count,
    );
  }
}
