import 'package:flutter_dotenv/flutter_dotenv.dart';

class Environment {
  static String pkmApiKey = dotenv.env['PKM_API_KEY'] ?? 'no hay api key';
}
