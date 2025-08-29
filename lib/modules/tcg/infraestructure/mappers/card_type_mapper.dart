import 'package:pkm_tcg_app/modules/tcg/domain/domain.dart';

class CardTypeMapper {
  static CategoryCard map(String cardType) {
    switch (cardType.toLowerCase()) {
      case "pokemon":
        return CategoryCard.pokemon;
      case "energy":
        return CategoryCard.energy;
      case "trainer":
        return CategoryCard.trainer;
      default:
        return CategoryCard.pokemon;
    }
  }
}
