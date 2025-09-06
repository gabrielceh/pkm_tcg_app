import 'package:flutter/material.dart';
import 'package:pkm_tcg_app/modules/shared/presentation/widgets/widgets.dart';

class CardsSectionTitle extends StatelessWidget {
  final String title;
  final String? logo;
  final double? width;
  final double? height;
  final bool? showMessage;

  const CardsSectionTitle({
    super.key,
    required this.title,
    this.logo,
    this.width,
    this.height,
    this.showMessage = true,
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
          spacing: 5,
          children: [
            if (showMessage == true)
              const Text(
                "Ultimo set",
                style: TextStyle(fontSize: 18),
                textAlign: TextAlign.left,
              ),

            if (logo == null)
              Expanded(
                child: Center(
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            if (logo != null)
              Center(
                child: CustomImageNetworkErrorHandler(
                  imageUrl: logo!,
                  width: width,
                  height: 90,
                  fit: BoxFit.contain,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
