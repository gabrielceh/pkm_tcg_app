import 'package:pkm_tcg_app/modules/tcg/domain/domain.dart';

class FromCardToPokemonBasicCard {
  static PokemonBasicCard fromPokemnCard(PokemonCard card) {
    return PokemonBasicCard(
      id: card.id,
      name: card.name,
      imageUrl: card.imageLowQuality,
    );
  }

  static PokemonBasicCard fromPokemonCardsSet(SetCard set) {
    return PokemonBasicCard(id: set.id, name: set.name, imageUrl: set.image);
  }
}
