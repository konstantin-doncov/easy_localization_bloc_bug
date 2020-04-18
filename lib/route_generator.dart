import 'package:easy_localization_bloc_bug/pages/first_page.dart';
import 'package:easy_localization_bloc_bug/pages/splash_page.dart';
import 'package:flutter/material.dart';


class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case 'splash_page':
        return MaterialPageRoute(builder: (_) => SplashPage());
      case 'first_page':
        return MaterialPageRoute(builder: (_) => FirstPage());
    }
  }

}