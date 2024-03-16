import 'package:eventak/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:eventak/features/home/presenation/screens/home_screen.dart';
import 'package:eventak/features/on_borading/presentation/screens/on_boarding_view.dart';
import 'package:eventak/features/splash/presentation/screens/splash_screen.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(routes: [
  GoRoute(
    path: "/",
    builder: (context, state) => const SplashScreen(),
  ),
  GoRoute(
    path: "/OnBoardingView",
    builder: (context, state) =>const  OnBoardingView(),
  ),
  GoRoute(
    path: "/HomeScreen",
    builder: (context, state) => const HomeScreen(),
  ),
  GoRoute(
    path: "/SignIn",
    builder: (context, state) => const SignIn(),
  ),
  
]);
