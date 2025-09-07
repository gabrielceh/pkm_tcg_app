import 'package:pkm_tcg_app/config/api_service/api_service_barrel.dart';
import 'package:pkm_tcg_app/modules/tcg/domain/domain.dart';
import 'package:pkm_tcg_app/modules/tcg/infraestructure/models/pokemon_cards_set_response.dart';

import '../mappers/pokemon_set_mapper.dart';

class PkmTcgSetsDatasource extends PokemonCardsSetDatasource {
  final ApiClient _apiClient = ApiManager.get('sets');

  PokemonCardsSet _jsonToPokemonCardsSet(Map<String, dynamic> response) {
    final setModel = PokemonCardsSetResponse.fromJson(response);
    return PokemonSetMapper.setToEntity(setModel);
  }

  @override
  Future<PokemonCardsSet> getPokemonSetById(String id) async {
    final dataResponse = await _apiClient.get("/$id");
    try {
      final set = _jsonToPokemonCardsSet(dataResponse);
      return set;
    } catch (e) {
      print("Error getPokemonSetById: $e");
      return PokemonCardsSet(
        id: "",
        name: "",
        cards: [],
        cardCount: SetCardCount(total: 0, official: 0),
      );
    }
  }

  @override
  Future<List<PokemonCardsSet>> getPokemonSets({int? page = 1}) async {
    try {
      final dataResponse = await _apiClient.get(
        "",
        params: {
          'sort:field': 'releaseDate',
          'sort:order': 'DESC',
          'serie.id': 'not:tcgp',
          'pagination:itemsPerPage': '20',
          'pagination:page': page,
        },
      );
      final List<PokemonCardsSet> sets = [];

      for (final set in dataResponse) {
        sets.add(_jsonToPokemonCardsSet(set));
      }

      return sets;
    } catch (e) {
      print("Error getPokemonSets: $e");
      return [];
    }
  }
}
