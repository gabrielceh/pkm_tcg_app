import 'package:flutter/material.dart';
import 'package:pkm_tcg_app/modules/shared/constants/constants.dart';
import 'package:pkm_tcg_app/modules/shared/presentation/widgets/custom_image_network_error_handler.dart';
import 'package:pkm_tcg_app/modules/shared/utils/utils.dart';

class CardShowImage extends StatelessWidget {
  final String imageUrl;

  const CardShowImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return IconButton(
      onPressed: () {
        // showDialog(
        //   context: context,
        //   builder: (context) {
        //     return Dialog(
        //       insetPadding: const EdgeInsets.all(20),
        //       shape: RoundedRectangleBorder(
        //         borderRadius: BorderRadius.circular(12),
        //       ),
        //       child: SizedBox(
        //         width: 400,
        //         height: 450,
        //         child: CustomImageNetworkErrorHandler(
        //           imageUrl: imageUrl,
        //           fit: BoxFit.cover,
        //         ),
        //       ),
        //     );
        //   },
        // );
        _customShowGeneralDialog(context, imageUrl);
      },
      icon: const Icon(Icons.zoom_out_map_rounded),
      color: theme.colorScheme.primary,
    );
  }
}

Future<Object?> _customShowGeneralDialog(
  BuildContext context,
  String imageUrl,
) {
  final imgAspectRatio = resizeWithAspectRatio(
    originalWidth: ImageCardSizes.high().width,
    originalHeight: ImageCardSizes.high().height,
    newWidth: 328,
  );

  return showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: "Cerrar",
    transitionDuration: const Duration(milliseconds: 500),
    pageBuilder: (context, animation, secondaryAnimation) {
      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            width: imgAspectRatio["width"]!,
            height: imgAspectRatio["height"]!,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: CustomImageNetworkErrorHandler(
              imageUrl: imageUrl,
              width: imgAspectRatio["width"]!,
              height: imgAspectRatio["height"]!,
              // fit: BoxFit.cover,
            ),
          ),
        ),
      );
    },
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      // animación de entrada (desde abajo) y sale hacia abajo
      final offsetAnimation =
          Tween<Offset>(
            begin: const Offset(0, 1), // empieza fuera de la pantalla abajo
            end: Offset(0, -0.2), // punto donde termina la animación
          ).animate(
            CurvedAnimation(
              parent: animation,
              curve: Curves.easeOut,
              reverseCurve: Curves.elasticOut,
            ),
          );

      // animación de salida (hacia arriba)
      // final exitAnimation = Tween<Offset>(
      //   begin: Offset(0, -0.25),
      //   end: const Offset(0, -1), // sale hacia arriba
      // ).animate(animation);

      return SlideTransition(position: offsetAnimation, child: child);
    },
  );
}
