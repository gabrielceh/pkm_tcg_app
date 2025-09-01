import 'package:flutter/material.dart';
import 'package:pkm_tcg_app/modules/tcg/domain/domain.dart';
import 'package:pkm_tcg_app/modules/tcg/presentation/widgets/home_screen/custom_header_set_home.dart';

class SetsHorizontalListView extends StatefulWidget {
  final List<PokemonCardsSet> sets;
  final String? title;

  const SetsHorizontalListView({super.key, required this.sets, this.title});

  @override
  State<SetsHorizontalListView> createState() => _SetsHorizontalListViewState();
}

class _SetsHorizontalListViewState extends State<SetsHorizontalListView> {
  final ScrollController scrollController = ScrollController();

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return SizedBox(
      height: 60,

      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            if (widget.title != null)
              Text(widget.title!, style: theme.textTheme.titleLarge),

            Expanded(
              child: ListView.builder(
                controller: scrollController,
                scrollDirection: Axis.horizontal,
                itemCount: widget.sets.length,
                itemBuilder: (context, index) {
                  if (index == widget.sets.length - 1) {
                    return Row(
                      children: [
                        CustomHeaderSetHome(set: widget.sets[index]),
                        SizedBox(
                          width: 70,
                          child: Text(
                            'Más',
                            style: theme.textTheme.titleSmall,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    );
                  }
                  return CustomHeaderSetHome(set: widget.sets[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
