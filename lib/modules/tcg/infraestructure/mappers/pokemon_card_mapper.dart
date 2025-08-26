import 'package:pkm_tcg_app/modules/tcg/domain/entities/entities.dart';
import 'package:pkm_tcg_app/modules/tcg/infraestructure/mappers/card_attack_mapper.dart';
import 'package:pkm_tcg_app/modules/tcg/infraestructure/mappers/color_type_card_map.dart';
import 'package:pkm_tcg_app/modules/tcg/infraestructure/models/pokemon_card_response.dart';

class PokemonCardMapper {
  static PokemonCard pokemonCardToEntity(PokemonCardResponse pokemonCard) {
    return PokemonCard(
      id: pokemonCard.id,
      name: pokemonCard.name,
      cardType: pokemonCard.supertype,
      subtypes: pokemonCard.subtypes,
      hp: pokemonCard.hp ?? "",
      types: pokemonCard.types != null
          ? pokemonCard.types!
                .map((color) => ColorTypeCardMap.map(color))
                .toList()
          : [],
      evolvesTo: pokemonCard.evolvesTo ?? [],
      rules: pokemonCard.rules ?? [],
      attacks: pokemonCard.attacks == null
          ? []
          : pokemonCard.attacks!
                .map((att) => CardAttackMapper.cardAttackToEntity(att))
                .toList(),
      dataSet: CardSet(
        id: pokemonCard.pokemonCardSet.id,
        name: pokemonCard.pokemonCardSet.name,
        images: CardSetImages(
          symbol: pokemonCard.pokemonCardSet.images['symbol'] ?? '',
          logo: pokemonCard.pokemonCardSet.images['logo'] ?? '',
        ),
      ),
      number: pokemonCard.number,
      artist: pokemonCard.artist ?? "",
      rarity: pokemonCard.rarity,
      images: CardImages(
        small: pokemonCard.images['small'] ?? '',
        large: pokemonCard.images['large'] ?? '',
      ),
      tcgplayer: Tcgplayer(
        url: pokemonCard.tcgplayer.url,
        updatedAt: pokemonCard.tcgplayer.updatedAt,
        prices: Prices(
          holofoil: Holofoil(
            low: pokemonCard.tcgplayer.prices.holofoil?.low ?? 0.0,
            mid: pokemonCard.tcgplayer.prices.holofoil?.mid ?? 0.0,
            high: pokemonCard.tcgplayer.prices.holofoil?.high ?? 0.0,
            market: pokemonCard.tcgplayer.prices.holofoil?.market ?? 0.0,
            directLow: pokemonCard.tcgplayer.prices.holofoil?.directLow,
          ),
        ),
      ),
    );
  }
}
