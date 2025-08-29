import 'package:pkm_tcg_app/modules/tcg/domain/entities/entities.dart';

abstract class PokemonCardsSetRepository {
  Future<List<PokemonCardsSet>> getPokemonSets({int? page = 1});
  Future<PokemonCardsSet> getPokemonSetById(String id);
}
