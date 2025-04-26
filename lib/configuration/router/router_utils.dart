import 'package:flutter/material.dart';

class RouterUtils {
  RouterUtils._();
  static String nestedRoute(
    String baseRoute,
    String route1, [
    String? route2,
    String? route3,
    String? route4,
    String? route5,
  ]) {
    StringBuffer stringBuffer = StringBuffer();
    stringBuffer.write(baseRoute);
    stringBuffer.write("/");
    stringBuffer.write(route1);

    if (route2 != null) {
      stringBuffer.write("/");
      stringBuffer.write(route2);
    }
    if (route3 != null) {
      stringBuffer.write("/");
      stringBuffer.write(route3);
    }
    if (route4 != null) {
      stringBuffer.write("/");
      stringBuffer.write(route4);
    }
    if (route5 != null) {
      stringBuffer.write("/");
      stringBuffer.write(route5);
    }

    debugPrint("The route is : ${stringBuffer.toString()}");
    return stringBuffer.toString();
  }
}
