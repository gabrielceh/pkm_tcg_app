import 'package:dio/dio.dart';
import 'package:pkm_tcg_app/config/constants/environment.dart';
import 'package:pkm_tcg_app/modules/tcg/domain/domain.dart';
import 'package:pkm_tcg_app/modules/tcg/infraestructure/mappers/pokemon_card_mapper.dart';
import 'package:pkm_tcg_app/modules/tcg/infraestructure/models/pokemon_card_response.dart';

class PkmTcgDatasource extends TcgDatasource {
  final dio = Dio(
    BaseOptions(
      baseUrl: 'https://api.pokemontcg.io/v2',
      headers: {
        'X-Api-Key': Environment.pkmApiKey,
        'Content-Type': 'application/json',
      },
    ),
  );

  PokemonCard _jsonToPokemonCard(dynamic json) {
    final cardModel = PokemonCardResponse.fromJson(json);
    return PokemonCardMapper.pokemonCardToEntity(cardModel);
  }

  @override
  Future<List<PokemonCard>> getPokemonCardById(String id) {
    // TODO: implement getPokemonCardById
    throw UnimplementedError();
  }

  @override
  Future<PaginatedPokemonCards> getPokemonCards({int? page = 1}) async {
    try {
      final res = await dio.get(
        '/cards',
        queryParameters: {
          'orderBy': '-set.releaseDate',
          'pageSize': 20,
          'page': page,
        },
      );
      final cards = res.data['data']
          ? res.data['data'].map((card) => _jsonToPokemonCard(card)).toList()
          : [];
      return PaginatedPokemonCards(
        count: res.data['count'],
        page: res.data['page'],
        pageSize: res.data['pageSize'],
        totalCount: res.data['totalCount'],
        cards: cards,
      );
    } catch (e) {
      return PaginatedPokemonCards(
        count: 0,
        page: 0,
        pageSize: 0,
        totalCount: 0,
        cards: [],
      );
    }
  }

  @override
  Future<PaginatedPokemonCards> getPokemonCardsBySet({
    required String setId,
    int? page = 1,
  }) async {
    try {
      final res = await dio.get(
        '/cards',
        queryParameters: {
          'orderBy': 'id',
          'pageSize': 20,
          'page': page,
          'q': 'set.id:$setId',
        },
      );
      final cards = res.data['data']
          ? res.data['data'].map((card) => _jsonToPokemonCard(card)).toList()
          : [];
      return PaginatedPokemonCards(
        count: res.data['count'],
        page: res.data['page'],
        pageSize: res.data['pageSize'],
        totalCount: res.data['totalCount'],
        cards: cards,
      );
    } catch (e) {
      return PaginatedPokemonCards(
        count: 0,
        page: 0,
        pageSize: 0,
        totalCount: 0,
        cards: [],
      );
    }
  }

  @override
  Future<PokemonCardsSet> getPokemonSetById(String id) {
    // TODO: implement getPokemonSetById
    throw UnimplementedError();
  }

  @override
  Future<List<PokemonCardsSet>> getPokemonSets({int? page = 1}) {
    // TODO: implement getPokemonSets
    throw UnimplementedError();
  }
}
