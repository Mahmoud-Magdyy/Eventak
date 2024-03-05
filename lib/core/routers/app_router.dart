import 'package:eventak/features/on_borading/presentation/screens/on_boarding_screens.dart';
import 'package:eventak/features/splash/presentation/screens/splash_screen.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(routes: [
  GoRoute(
    path: "/",
    builder: (context, state) => const SplashScreen(),
  ),
  GoRoute(
    path: "/OnBoarding",
    builder: (context, state) => const OnBoardingScreens(),
  ),
]);
