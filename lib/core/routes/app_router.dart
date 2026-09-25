import 'package:flutter_application_1/features/home/profiles_screen.dart';
import 'package:flutter_application_1/features/presentation/screens/payment_screen.dart';
import 'package:flutter_application_1/features/presentation/screens/login_screen.dart';
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
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/home',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: '/favorite',
        builder: (context, state) => const FavoritesScreen(),
      ),
      GoRoute(
        path: '/profile',
        builder: (context, state) => const Profilescreen(),
      ),
      GoRoute(
        path: '/restaurantScreen',
        builder: (context, state) => const RestaurantScreen(),
      ),
      GoRoute(
        path: '/payment',
        builder: (context, state) => const PaymentScreen(),
      ),
    ],
  );
});