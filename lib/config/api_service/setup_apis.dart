import 'package:pkm_tcg_app/config/api_service/api_manager.dart';

void setupApis() {
  // API para pokemon sets
  ApiManager.register(
    name: 'sets',
    baseUrl: 'https://api.tcgdex.net/v2/en/sets',
  );

  ApiManager.register(
    name: 'cards',
    baseUrl: 'https://api.tcgdex.net/v2/en/cards',
  );
}
