import 'package:dating_app/presentation/screens/discover_screen.dart';
import 'package:dating_app/presentation/screens/explore_screen.dart';
import 'package:dating_app/presentation/screens/matches_screen.dart';
import 'package:dating_app/presentation/screens/profile_screen.dart';
import 'package:flutter/material.dart';

class Routes {
  static const String discover = '/discover';
  static const String matches = '/matches';
  static const String explore = '/explore';
  static const String profile = '/profile';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case discover:
        return MaterialPageRoute(builder: (_) => const DiscoverScreen());
      case matches:
        return MaterialPageRoute(builder: (_) => const MatchesScreen());
      case explore:
        return MaterialPageRoute(builder: (_) => const ExploreScreen());
      case profile:
        return MaterialPageRoute(builder: (_) => const ProfileScreen());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
