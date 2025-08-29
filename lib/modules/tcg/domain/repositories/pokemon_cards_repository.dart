import 'package:pkm_tcg_app/modules/tcg/domain/entities/entities.dart';

abstract class PokemonCardsRepository {
  Future<List<PokemonCard>> getPokemonCardById(String id);
}
