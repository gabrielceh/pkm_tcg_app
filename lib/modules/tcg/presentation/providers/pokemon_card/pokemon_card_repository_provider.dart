import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pkm_tcg_app/modules/tcg/domain/domain.dart';
import 'package:pkm_tcg_app/modules/tcg/infraestructure/infraestructure.dart';

final pokemonCardsRepositoryProvider = Provider<PokemonCardsRepository>(
  (ref) => PokemonCardsRepositoryImpl(PkmTcgCardsDatasource()),
);
