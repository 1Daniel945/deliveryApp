import 'package:flutter_application_1/features/home/profiles_screen.dart';
import 'package:flutter_application_1/features/presentation/screens/restaurant_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../features/home/home_screen.dart';
import '../../features/home/favorites_screen.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    initialLocation: '/',
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const RestaurantScreen(),
      ),
      GoRoute(
        path: '/favorite',
        builder: (context, state) => const FavoritesScreen(),
      ),
      GoRoute(
        path: '/profile',
        builder: (context, state) => const Profilescreen(),
      ),
    ],
  );
});