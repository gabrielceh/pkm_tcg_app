import 'package:flutter/material.dart';

import 'package:pkm_tcg_app/modules/shared/presentation/widgets/widgets.dart';
import 'package:pkm_tcg_app/modules/tcg/domain/domain.dart';

class CardSetSection extends StatelessWidget {
  final CardSetDetails cardSet;
  final String idInSet;

  const CardSetSection({
    super.key,
    required this.cardSet,
    required this.idInSet,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.black12, width: 1),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 5,
            spreadRadius: 0,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            if (cardSet.logo == null)
              Text(cardSet.name, style: TextStyle(fontSize: 16)),
            if (cardSet.logo != null)
              CustomImageNetworkErrorHandler(imageUrl: cardSet.logo!),

            InnerShadow(
              blur: 5,
              color: Colors.black12,
              offset: const Offset(0, 5),
              child: Container(
                height: 25,
                width: 150,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8.0,
                    vertical: 2,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      if (cardSet.symbol != null)
                        CustomImageNetworkErrorHandler(
                          imageUrl: cardSet.symbol!,
                          width: 15,
                        ),

                      Text(
                        '$idInSet / ${cardSet.cardCount?.official}',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
