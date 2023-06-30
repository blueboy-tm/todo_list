import 'package:flutter/material.dart';

RoundedRectangleBorder getShapeWidget(double doubleRadius) {
  return RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(doubleRadius),
  );
}

RoundedRectangleBorder getTopShapeWidget(double doubleRadius) {
  return RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
      topRight: Radius.circular(doubleRadius),
      topLeft: Radius.circular(doubleRadius),
    ),
  );
}
