import 'package:flutter/material.dart';
import 'package:pkm_tcg_app/modules/shared/presentation/widgets/widgets.dart';

class CardsSectionTitle extends StatelessWidget {
  final String title;
  final String? logo;
  final double? width;
  final double? height;

  const CardsSectionTitle({
    super.key,
    required this.title,
    this.logo,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 140,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 10,
          children: [
            const Text(
              "Ultimo set",
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.left,
            ),
            Center(
              child: logo == null
                  ? Text(title, textAlign: TextAlign.center)
                  : CustomImageNetworkErrorHandler(
                      imageUrl: logo!,
                      width: width,
                      height: height,
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
