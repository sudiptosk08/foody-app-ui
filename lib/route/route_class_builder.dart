import 'package:flutter_app/view/screen/checkout_screen.dart';
import 'package:flutter_app/view/screen/home_screen.dart';

typedef T Constructor<T>();

final Map<String, Constructor<Object>> _constructors =
    <String, Constructor<Object>>{};

void register<T>(Constructor<T> constructor) {
  _constructors[T.toString()] = constructor;
}

class RouteClassBuilder {
  static void registerClasses() {
    register<HomeScreen>(() => HomeScreen());
    register<CheckoutScreen>(() => CheckoutScreen(
          dataPass: true,
        ));
  }

  static dynamic fromString(String type) {
    return _constructors[type]();
  }
}
