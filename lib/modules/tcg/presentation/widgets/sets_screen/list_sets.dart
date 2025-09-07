import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pkm_tcg_app/modules/shared/presentation/widgets/custom_image_network_error_handler.dart';

import 'package:pkm_tcg_app/modules/tcg/domain/domain.dart';

class ListSets extends StatefulWidget {
  final List<PokemonCardsSet> sets;
  final VoidCallback loadNextPage;

  const ListSets({super.key, required this.sets, required this.loadNextPage});

  @override
  State<ListSets> createState() => _ListSetsState();
}

class _ListSetsState extends State<ListSets> {
  final ScrollController scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    // siempr, despues de añadir un listener, hacemos el dispose
    scrollController.addListener(() {
      if ((scrollController.position.pixels + 200) >=
          scrollController.position.maxScrollExtent) {
        widget.loadNextPage();
      }
    });
  }

  @override
  void dispose() {
    scrollController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.4,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      controller: scrollController,
      itemCount: widget.sets.length,
      itemBuilder: (context, index) {
        return _SetCardImage(set: widget.sets[index], width: 200, height: 75);
      },
    );
  }
}

class _SetCardImage extends StatelessWidget {
  final PokemonCardsSet set;
  final double width;
  final double height;

  const _SetCardImage({
    required this.set,
    this.width = double.infinity,
    this.height = 100.0,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push('/sets/${set.id}');
      },
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
              spacing: 10,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (set.logo == null)
                  Text(
                    set.name,
                    style: Theme.of(context).textTheme.titleSmall,
                    textAlign: TextAlign.center,
                  ),

                if (set.logo != null)
                  CustomImageNetworkErrorHandler(
                    imageUrl: set.logo!,
                    height: height * 0.60,
                    width: width / 1.5,
                    fit: BoxFit.contain,
                    customErrorWidget: Text(
                      set.name,
                      style: Theme.of(context).textTheme.titleSmall,
                      textAlign: TextAlign.center,
                    ),
                  ),
                if (set.symbol != null)
                  CustomImageNetworkErrorHandler(
                    imageUrl: set.symbol!,
                    height: 25,
                    width: 40,
                    fit: BoxFit.contain,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
