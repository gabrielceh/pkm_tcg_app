import 'package:flutter/material.dart';
import 'package:pkm_tcg_app/modules/shared/presentation/widgets/widgets.dart';

class SetScreenTitle extends StatelessWidget {
  final String title;
  final String? logo;
  final double? width;
  final double? height;

  const SetScreenTitle({
    super.key,
    required this.title,
    this.logo,
    this.width,
    this.height,
  });

  @override
  Widget build(BuildContext context) {
    return logo == null
        ? Text(
            title,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          )
        : CustomImageNetworkErrorHandler(
            imageUrl: logo!,
            width: width,
            height: height,
            fit: BoxFit.contain,
          );
  }
}
