import 'package:pkm_tcg_app/modules/tcg/domain/entities/entities.dart';

class ColorTypeCardMap {
  static ColorTypeCard map(String colorTypeCard) {
    switch (colorTypeCard.toLowerCase()) {
      case "incolora":
        return ColorTypeCard.colorless;
      case "oscura":
        return ColorTypeCard.darkness;
      case "dragón":
        return ColorTypeCard.dragon;
      case "hada":
        return ColorTypeCard.fighting;
      case "lucha":
        return ColorTypeCard.fighting;
      case "fuego":
        return ColorTypeCard.fire;
      case "planta":
        return ColorTypeCard.grass;
      case "rayo":
        return ColorTypeCard.lightning;
      case "metálica":
        return ColorTypeCard.metal;
      case "psíquico":
        return ColorTypeCard.psychic;
      case "agua":
        return ColorTypeCard.water;
      default:
        return ColorTypeCard.colorless;
    }
  }
}
