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
      path: SplashRoutes.path,
      name: SplashRoutes.name,
      builder: (context, state) => const SplashPage(),
    ),
    GoRoute(
      path: MainRoute.path,
      name: MainRoute.name,
      builder: (context, state) => const MainView(),
    ),
    GoRoute(
      path: HomeRoutes.path,
      name: HomeRoutes.name,
      builder: (context, state) => const HomePage(),
    ),
  ],
);
