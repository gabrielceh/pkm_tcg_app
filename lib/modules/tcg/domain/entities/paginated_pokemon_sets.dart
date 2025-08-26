import 'pokemon_cards_set.dart';

class PaginatedPokemonSets {
  final List<PokemonCardsSet> sets;
  final int page;
  final int pageSize;
  final int count;
  final int totalCount;

  PaginatedPokemonSets({
    required this.page,
    required this.pageSize,
    required this.count,
    required this.totalCount,
    required this.sets,
  });
}
