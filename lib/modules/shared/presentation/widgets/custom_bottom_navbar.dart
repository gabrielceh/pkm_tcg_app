import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBottomNavbar extends StatelessWidget {
  static int getCurrentIndex(BuildContext context) {
    final String location = GoRouterState.of(context).uri.toString();
    switch (location) {
      case '/':
        return 0;
      case '/search':
        return 1;
      case '/favorites':
        return 2;
      default:
        return 0;
    }
  }

  const CustomBottomNavbar({super.key});

  void _onItemTapped(BuildContext context, int index) {
    switch (index) {
      case 0:
        // home
        context.go('/');
        break;
      case 1:
        // categorias
        context.push('/search');
        break;
      case 2:
        // favoritos
        context.push('/favorites');
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return NavigationBar(
      elevation: 0,
      selectedIndex: getCurrentIndex(context),
      indicatorColor: colorScheme.primary,
      // value es el indice del item que se ha pulsado
      onDestinationSelected: (value) => _onItemTapped(context, value),
      destinations: [
        // necesita mas de un item
        NavigationDestination(
          selectedIcon: Icon(
            Icons.catching_pokemon,
            color: colorScheme.secondaryContainer,
          ),
          icon: Icon(Icons.catching_pokemon_outlined),
          label: 'Home',
        ),
        NavigationDestination(
          selectedIcon: Icon(
            Icons.search,
            color: colorScheme.secondaryContainer,
          ),
          icon: Icon(Icons.search_outlined),
          label: 'Buscar',
        ),

        NavigationDestination(
          selectedIcon: Icon(
            Icons.favorite,
            color: colorScheme.secondaryContainer,
          ),
          icon: Icon(Icons.favorite_outline),
          label: 'Favoritos',
        ),
      ],
    );
  }
}
