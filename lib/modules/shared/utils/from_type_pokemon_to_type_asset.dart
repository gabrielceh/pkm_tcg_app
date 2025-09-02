import 'package:pkm_tcg_app/modules/tcg/domain/domain.dart';

class FromTypePokemonToTypeAsset {
  static String toAsset(ColorTypeCard type) {
    switch (type) {
      case ColorTypeCard.colorless:
        return 'assets/images/tcg_types/colorless.png';
      case ColorTypeCard.darkness:
        return 'assets/images/tcg_types/darkness.png';
      case ColorTypeCard.dragon:
        return 'assets/images/tcg_types/dragon.png';
      case ColorTypeCard.fairy:
        return 'assets/images/tcg_types/fairy.png';
      case ColorTypeCard.fighting:
        return 'assets/images/tcg_types/fighting.png';
      case ColorTypeCard.fire:
        return 'assets/images/tcg_types/fire.png';
      case ColorTypeCard.grass:
        return 'assets/images/tcg_types/grass.png';
      case ColorTypeCard.lightning:
        return 'assets/images/tcg_types/lightning.png';
      case ColorTypeCard.metal:
        return 'assets/images/tcg_types/metal.png';
      case ColorTypeCard.psychic:
        return 'assets/images/tcg_types/psychic.png';
      case ColorTypeCard.water:
        return 'assets/images/tcg_types/water.png';
      default:
        return 'assets/images/tcg_types/colorless.png';
    }
  }
}
