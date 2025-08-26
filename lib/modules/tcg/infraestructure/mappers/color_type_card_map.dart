import 'package:pkm_tcg_app/modules/tcg/domain/entities/entities.dart';

class ColorTypeCardMap {
  static ColorTypeCard map(String colorTypeCard) {
    switch (colorTypeCard.toLowerCase()) {
      case "colorless":
        return ColorTypeCard.colorless;
      case "darkness":
        return ColorTypeCard.darkness;
      case "dragon":
        return ColorTypeCard.dragon;
      case "fighting":
        return ColorTypeCard.fighting;
      case "fire":
        return ColorTypeCard.fire;
      case "grass":
        return ColorTypeCard.grass;
      case "lightning":
        return ColorTypeCard.lightning;
      case "metal":
        return ColorTypeCard.metal;
      case "psychic":
        return ColorTypeCard.psychic;
      case "water":
        return ColorTypeCard.water;
      default:
        return ColorTypeCard.colorless;
    }
  }
}
