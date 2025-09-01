import 'package:flutter/material.dart';

class CustomImageNetworkErrorHandler extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit fit;
  final String? errorMessage;
  final Widget? customErrorWidget;
  final Widget? customLoadingWidget;

  const CustomImageNetworkErrorHandler({
    super.key,
    required this.imageUrl,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.errorMessage,
    this.customErrorWidget,
    this.customLoadingWidget,
  });

  @override
  Widget build(BuildContext context) {
    return Image.network(
      imageUrl,
      width: width,
      height: height,
      fit: fit,

      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress != null) {
          return Center(
            child:
                customLoadingWidget ??
                CircularProgressIndicator(
                  value: loadingProgress.expectedTotalBytes != null
                      ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!
                      : null,
                ),
          );
        }
        return child;
      },

      errorBuilder: (context, error, stackTrace) {
        return customErrorWidget ??
            Container(
              width: width,
              height: height,
              decoration: BoxDecoration(color: Colors.grey[600]),
              child: Center(
                child: Text(
                  errorMessage ?? 'Error al cargar la imagen',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            );
      },
    );
  }
}
