/// Calcula las nuevas dimensiones manteniendo la proporción
Map<String, double> resizeWithAspectRatio({
  required double originalWidth,
  required double originalHeight,
  double? newWidth,
  double? newHeight,
}) {
  if (newWidth == null && newHeight == null) {
    throw ArgumentError("Debes proporcionar al menos newWidth o newHeight");
  }

  if (newWidth != null) {
    final scale = newWidth / originalWidth;
    return {"width": newWidth, "height": (originalHeight * scale)};
  } else {
    final scale = newHeight! / originalHeight;
    return {"width": (originalWidth * scale), "height": newHeight};
  }
}
