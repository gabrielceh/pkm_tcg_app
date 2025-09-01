import 'package:pkm_tcg_app/modules/tcg/domain/entities/entities.dart';

abstract class PokemonCardsRepository {
  Future<PokemonCard> getPokemonCardById(String id);
}
