import 'package:flutter/material.dart';

BorderRadius getBorderRadiusWidget(double doubleRadius) {
  return BorderRadius.circular(doubleRadius);
}

BorderRadius getButtonBorderRadiusWidget(double doubleRadius) {
  return BorderRadius.only(
    bottomLeft: Radius.circular(doubleRadius),
    bottomRight: Radius.circular(doubleRadius),
  );
}

BorderRadius getTopBorderRadiusWidget(double doubleRadius) {
  return BorderRadius.only(
    topLeft: Radius.circular(doubleRadius),
    topRight: Radius.circular(doubleRadius),
  );
}

BorderRadius getRightBorderRadiusWidget(double doubleRadius) {
  return BorderRadius.only(
    bottomRight: Radius.circular(doubleRadius),
    topRight: Radius.circular(doubleRadius),
  );
}

BorderRadius getLeftBorderRadiusWidget(double doubleRadius) {
  return BorderRadius.only(
    topLeft: Radius.circular(doubleRadius),
    bottomLeft: Radius.circular(doubleRadius),
  );
}

BorderRadius getTopRightBorderRadiusWidget(double doubleRadius) {
  return BorderRadius.only(
      topRight: Radius.circular(doubleRadius));
}

BorderRadius getTopLeftBorderRadiusWidget(double doubleRadius) {
  return BorderRadius.only(
      topLeft: Radius.circular(doubleRadius));
}

BorderRadius getBottomRightBorderRadiusWidget(double doubleRadius) {
  return BorderRadius.only(
      bottomRight: Radius.circular(doubleRadius));
}

BorderRadius getBottomLeftBorderRadiusWidget(double doubleRadius) {
  return BorderRadius.only(
      bottomLeft: Radius.circular(doubleRadius));
}
