import 'package:pkm_tcg_app/modules/tcg/domain/entities/entities.dart';
import 'package:pkm_tcg_app/modules/tcg/infraestructure/models/pokemon_cards_set_response.dart';

class PokemonSetMapper {
  static PokemonCardsSet setToEntity(PokemonCardsSetResponse set) {
    return PokemonCardsSet(
      id: set.id,
      name: set.name,
      series: set.series,
      printedTotal: set.printedTotal,
      total: set.total,
      ptcgoCode: set.ptcgoCode,
      releaseDate: set.releaseDate,
      updatedAt: set.updatedAt,
      images: ImagesSet(symbol: set.images.symbol, logo: set.images.logo),
    );
  }
}
