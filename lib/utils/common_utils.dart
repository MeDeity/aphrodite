import 'package:flutter/material.dart';

class CommonUtils {
  static String getImgPath(String name, {String format: 'png'}) {
    return 'assets/images/$name.$format';
  }

  static Widget loadAssetImage(String name,{double width, double height, BoxFit fit, Color color}) {
    return Image.asset(
      getImgPath(name),
      height: height,
      width: width,
      fit: fit,
      color: color,
    );
  }

  static bool isListEmpty(List list) {
    return (null == list || list.isEmpty);
  }

  static bool isListNotEmpty(List list) {
    return (null != list && list.isNotEmpty);
  }
}
