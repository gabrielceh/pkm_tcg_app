import 'dart:ui';

// const imageCardSizes = {"high": Size(600, 825), "low": Size(245, 337)};

class ImageCardSizes {
  static final double _highWidth = 600.0;
  static final double _highHeight = 825.0;
  static final double _lowWidth = 245.0;
  static final double _lowHeight = 337.0;

  static Size high() {
    return Size(_highWidth, _highHeight);
  }

  static Size low() {
    return Size(_lowWidth, _lowHeight);
  }
}
