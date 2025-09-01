import 'package:pkm_tcg_app/modules/tcg/domain/entities/entities.dart';
import 'package:pkm_tcg_app/modules/tcg/infraestructure/mappers/color_type_card_map.dart';
import 'package:pkm_tcg_app/modules/tcg/infraestructure/models/pokemon_card_response.dart';

import 'card_type_mapper.dart';

class PokemonCardMapper {
  static PokemonCard pokemonCardToEntity(PokemonCardResponse pokemonCard) {
    return PokemonCard(
      id: pokemonCard.id,
      name: pokemonCard.name,
      idInSet: pokemonCard.localId,
      set: CardSetDetails(
        id: pokemonCard.set.id,
        name: pokemonCard.set.name,
        logo: pokemonCard.set.logo == null
            ? null
            : '${pokemonCard.set.logo}.png',
        symbol: pokemonCard.set.symbol == null
            ? null
            : '${pokemonCard.set.symbol}.png',
        cardCount: CardSetCount(
          official: pokemonCard.set.cardCount?.official,
          total: pokemonCard.set.cardCount?.total,
        ),
      ),
      cardType: CardTypeMapper.map(pokemonCard.category),
      rarity: pokemonCard.rarity,
      imageHighQuality: pokemonCard.image == null
          ? null
          : '${pokemonCard.image}/high.png',
      imageLowQuality: pokemonCard.image == null
          ? null
          : '${pokemonCard.image}/low.png',
      types: pokemonCard.types
          ?.map((type) => ColorTypeCardMap.map(type))
          .toList(),
      hp: pokemonCard.hp,
      evolvesFrom: pokemonCard.evolvesFrom,
      stage: pokemonCard.stage,
      attacks: pokemonCard.attacks?.map((attack) {
        return CardAttack(
          cost: attack.cost,
          name: attack.name,
          effect: attack.effect,
          damage: attack.damage,
        );
      }).toList(),
      abilities: pokemonCard.abilities?.map((ability) {
        return CardAbility(
          type: ability.type,
          name: ability.name,
          effect: ability.effect,
        );
      }).toList(),
    );
  }
}
