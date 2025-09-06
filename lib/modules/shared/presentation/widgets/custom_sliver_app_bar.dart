import 'package:flutter/material.dart';
import 'package:pkm_tcg_app/modules/shared/presentation/widgets/widgets.dart'
    show CustomAppBar;

class CustomSliverAppBar extends StatelessWidget {
  const CustomSliverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true, // nunca desaparece
      expandedHeight: 70.0, // Altura inicial (se mueve hasta aquí)
      collapsedHeight: kToolbarHeight, // Altura mínima (AppBar normal)
      // floating: true, // desapoarce cuando hace scroll
      // snap: true,
      flexibleSpace: FlexibleSpaceBar(
        title: CustomAppBar(title: 'Pkm Tcg'),
        titlePadding: const EdgeInsets.only(left: 10),
      ),
    );
  }
}
