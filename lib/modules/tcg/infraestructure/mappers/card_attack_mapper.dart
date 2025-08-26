import 'package:pkm_tcg_app/modules/tcg/domain/entities/entities.dart';
import 'package:pkm_tcg_app/modules/tcg/infraestructure/models/pokemon_card_response.dart';

class CardAttackMapper {
  static CardAttack cardAttackToEntity(CardAttackResponse cardAttack) {
    return CardAttack(
      name: cardAttack.name,
      cost: cardAttack.cost,
      convertedEnergyCost: cardAttack.convertedEnergyCost,
      damage: cardAttack.damage,
      text: cardAttack.text,
    );
  }
}
