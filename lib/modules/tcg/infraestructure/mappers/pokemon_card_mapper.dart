import 'package:pkm_tcg_app/modules/tcg/domain/entities/entities.dart';
import 'package:pkm_tcg_app/modules/tcg/infraestructure/mappers/color_type_card_map.dart';
import 'package:pkm_tcg_app/modules/tcg/infraestructure/models/pokemon_card_response.dart';

import 'card_type_mapper.dart';

class PokemonCardMapper {
  static PokemonCard pokemonCardToEntity(PokemonCardResponse pokemonCard) {
    return PokemonCard(
      id: pokemonCard.id,
      name: pokemonCard.name,
      cardType: CardTypeMapper.map(pokemonCard.cardType),
      imageHighQuality: '${pokemonCard.image}/high.png',
      imageLowQuality: '${pokemonCard.image}/low.png',
      rarity: pokemonCard.rarity,
      type: pokemonCard.type == null
          ? null
          : ColorTypeCardMap.map(pokemonCard.type!),
      hp: pokemonCard.hp,
      evolvesFrom: pokemonCard.evolvesFrom,
      attacks: pokemonCard.attacks == null
          ? []
          : pokemonCard.attacks!
                .map(
                  (attack) => CardAttack(
                    cost: attack.cost,
                    name: attack.name,
                    effect: attack.effect,
                    damage: attack.damage,
                  ),
                )
                .toList(),
    );
  }
}
