import 'package:daily_messages/src/ui/screens/home_screen.dart';
import 'package:daily_messages/src/ui/screens/settings_screen.dart';
import 'package:go_router/go_router.dart';

final routes = GoRouter(
  initialLocation: '/home',
  routes: [
    GoRoute(
      path: '/home',
      builder: (context, state) {
        return const HomeScreen();
      },
    ),
    GoRoute(
      path: '/settings',
      builder: (context, state) {
        return const SettingsScreen();
      },
    ),
  ],
);
