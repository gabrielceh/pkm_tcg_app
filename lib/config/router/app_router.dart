import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pkm_tcg_app/modules/shared/presentation/widgets/widgets.dart';
import 'package:pkm_tcg_app/modules/tcg/presentation/screens/screens.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return MainScaffold(child: child);
      },
      routes: [
        GoRoute(path: '/', builder: (context, state) => const HomeScreen()),
        GoRoute(
          path: '/search',
          builder: (context, state) => const Text("Search"),
        ),
        GoRoute(
          path: '/favorites',
          builder: (context, state) => const Text("Favorites"),
        ),
      ],
    ),

    GoRoute(
      path: '/card-details/:id',
      builder: (context, state) {
        final id = state.pathParameters['id']!;
        return CardDetailsScreen(cardId: id);
      },
    ),
  ],
);
