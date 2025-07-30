import 'package:e_commerce_app/features/home/view/home_page.dart';
import 'package:e_commerce_app/features/home/view/home_routes.dart';
import 'package:e_commerce_app/features/main/view/main_routes.dart';
import 'package:e_commerce_app/features/main/view/main_view.dart';
import 'package:e_commerce_app/features/splash/view/splash_page.dart';
import 'package:e_commerce_app/features/splash/view/splash_routes.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  initialLocation: SplashRoutes.path,
  routes: [
    GoRoute(
      name: SplashRoutes.name,
      path: SplashRoutes.path,
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      name: MainRoute.name,
      path: MainRoute.path,
      builder: (context, state) => const MainView(),
    ),
    GoRoute(
      name: HomeRoutes.name,
      path: HomeRoutes.path,
      builder: (context, state) => const HomePage(),
    ),
  ],
);
