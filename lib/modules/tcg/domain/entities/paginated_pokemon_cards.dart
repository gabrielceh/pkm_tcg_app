import 'pokemon_card.dart';

class PaginatedPokemonCards {
  final List<PokemonCard> cards;
  final int page;
  final int pageSize;
  final int count;
  final int totalCount;

  PaginatedPokemonCards({
    required this.page,
    required this.pageSize,
    required this.count,
    required this.totalCount,
    required this.cards,
  });
}
