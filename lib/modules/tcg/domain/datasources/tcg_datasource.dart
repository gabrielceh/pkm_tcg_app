import 'package:pkm_tcg_app/modules/tcg/domain/entities/entities.dart';

abstract class TcgDatasource {
  Future<PaginatedPokemonCards> getPokemonCards({int? page = 1});
  Future<PaginatedPokemonCards> getPokemonCardsBySet({
    required String setId,
    int? page = 1,
  });
  Future<List<PokemonCard>> getPokemonCardById(String id);

  Future<List<PokemonCardsSet>> getPokemonSets({int? page = 1});
  Future<PokemonCardsSet> getPokemonSetById(String id);
}
