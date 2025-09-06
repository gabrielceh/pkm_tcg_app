import 'package:pkm_tcg_app/modules/tcg/domain/entities/entities.dart';
import 'package:pkm_tcg_app/modules/tcg/infraestructure/models/pokemon_cards_set_response.dart';

class PokemonSetMapper {
  static String _urlSymbolToLogo(String urlSymbol) {
    final url = urlSymbol
        .replaceAll('/univ/', '/en/')
        .replaceAll('symbol', 'logo');
    return url;
  }

  static PokemonCardsSet setToEntity(PokemonCardsSetResponse set) {
    return PokemonCardsSet(
      cardCount: SetCardCount(
        firstEd: set.cardCount.firstEd,
        holo: set.cardCount.holo,
        normal: set.cardCount.normal,
        reverse: set.cardCount.reverse,
        official: set.cardCount.official,
        total: set.cardCount.total,
      ),
      cards: set.cards
          .map(
            (card) => SetCard(
              id: card.id,
              image: '${card.image}/low.png',
              localId: card.localId,
              name: card.name,
            ),
          )
          .toList(),
      id: set.id,
      name: set.name,
      serie: set.serie == null
          ? null
          : SetSerie(id: set.serie!.id, name: set.serie!.name),
      legal: set.legal == null
          ? null
          : SetLegal(
              expanded: set.legal!.expanded,
              standard: set.legal!.standard,
            ),
      releaseDate: set.releaseDate,
      logo: set.logo != null
          ? '${set.logo!}.png'
          : set.symbol != null
          ? '${_urlSymbolToLogo(set.symbol!)}.png'
          : null,
      symbol: set.symbol == null ? null : '${set.symbol!}.png',
    );
  }
}
