import 'package:go_router/go_router.dart';
import 'package:pkm_tcg_app/modules/tcg/presentation/screens/screens.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [GoRoute(path: '/', builder: (context, state) => const HomeScreen())],
);
