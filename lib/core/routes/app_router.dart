import 'package:flutter_application_1/features/configuration/screens/configuration_screen.dart';
import 'package:flutter_application_1/features/payments/screens/payment_method.dart';
import 'package:flutter_application_1/features/presentation/screens/payment_screen.dart';
import 'package:flutter_application_1/features/presentation/screens/login_screen.dart';
import 'package:flutter_application_1/features/presentation/screens/register_screen.dart';
import 'package:flutter_application_1/features/presentation/screens/restaurant_screen.dart';
import 'package:flutter_application_1/features/presentation/screens/verifyotp_screen.dart';
import 'package:flutter_application_1/features/profile/presentation/screens/profile_screen.dart';
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
        builder: (context, state) => const ConfigurationScreen(),
      ),
      GoRoute(
        path: '/editProfile',
        builder: (context, state) => const ProfileScreen(),
      ),
      GoRoute(
        path: '/restaurantScreen',
        builder: (context, state) => const RestaurantScreen(),
      ),
      GoRoute(
        path: '/payment',
        builder: (context, state) => const PaymentScreen(),
      ),
      GoRoute(
        path: '/paymentMethod',
        builder: (context, state) => const PaymentmethodScreen(),
      ),
      GoRoute(
        path: '/register',
        builder: (context, state) => const RegisterScreen(),
      ),
      GoRoute(
        path: '/otpView',
        builder: (context, state) {
          final email = state.extra as String;
          return OtpView(email: email);
        },
      ),
    ],
  );
});