import 'package:e_commerce_app/features/home/presentation/home_page.dart';
import 'package:e_commerce_app/features/home/presentation/home_routes.dart';
import 'package:e_commerce_app/features/main/presentation/main_routes.dart';
import 'package:e_commerce_app/features/main/presentation/main_screen.dart';
import 'package:e_commerce_app/features/splash/presentation/splash_page.dart';
import 'package:e_commerce_app/features/splash/presentation/splash_routes.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: SplashRoutes.path,
  routes: [
    GoRoute(
      path: SplashRoutes.path,
      name: SplashRoutes.name,
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: MainRoute.path,
      name: MainRoute.name,
      builder: (context, state) => const MainScreen(),
    ),
    GoRoute(
      path: HomeRoutes.path,
      name: HomeRoutes.name,
      builder: (context, state) => const HomePage(),
    ),
  ],
);
