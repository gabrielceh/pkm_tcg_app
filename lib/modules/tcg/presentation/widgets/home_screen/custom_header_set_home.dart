import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pkm_tcg_app/modules/shared/presentation/widgets/widgets.dart';
import 'package:pkm_tcg_app/modules/tcg/domain/domain.dart';

class CustomHeaderSetHome extends StatelessWidget {
  final PokemonCardsSet set;

  const CustomHeaderSetHome({super.key, required this.set});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push('/sets/${set.id}');
      },
      child: Container(
        width: 100,
        margin: const EdgeInsets.symmetric(horizontal: 6),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.black12),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: set.logo == null
                ? Text(
                    set.name,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 12),
                  )
                : CustomImageNetworkErrorHandler(imageUrl: set.logo!),
          ),
        ),
      ),
    );
  }
}
