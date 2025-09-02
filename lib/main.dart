import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:pkm_tcg_app/config/api_service/api_service_barrel.dart';
import 'config/router/app_router.dart';

Future<void> main() async {
  setupApis();

  await dotenv.load(fileName: '.env');

  runApp(ProviderScope(child: const MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
    );
  }
}
