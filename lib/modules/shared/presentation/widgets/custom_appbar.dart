import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CustomAppBar extends ConsumerWidget {
  final String? title;

  const CustomAppBar({super.key, this.title});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final colors = Theme.of(context).colorScheme;
    final titleStyle = Theme.of(context).textTheme.titleMedium;

    return SafeArea(
      // bottom: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SizedBox(
          width: double.infinity,
          child: Center(
            child: Row(
              children: [
                Icon(Icons.catching_pokemon, color: colors.primary),
                const SizedBox(width: 5),
                Text(
                  title ?? 'Pkm Tcg',
                  style: titleStyle?.copyWith(color: colors.primary),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
