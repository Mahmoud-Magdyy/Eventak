import 'package:eventak/core/services/service_locator.dart';
import 'package:eventak/features/auth/presentation/auth_cubit/regsiter_cubit/register_cubit.dart';
import 'package:eventak/features/auth/presentation/auth_cubit/reset_password_cubit/reset_password_cubit.dart';
import 'package:eventak/features/auth/presentation/auth_cubit/sign_in_cubit/sign_in_cubit.dart';
import 'package:eventak/features/auth/presentation/screens/forget_password_screen.dart';
import 'package:eventak/features/auth/presentation/screens/pass_reset_verficiton.dart';
import 'package:eventak/features/auth/presentation/screens/register_screen.dart';
import 'package:eventak/features/auth/presentation/screens/reset_password_screen.dart';
import 'package:eventak/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:eventak/features/create_event/presentation/screens/page_view_event.dart';
import 'package:eventak/features/home/presenation/screens/bottom_nav_bar.dart';
import 'package:eventak/features/home/presenation/screens/home_screen.dart';
import 'package:eventak/features/on_borading/presentation/screens/on_boarding_view.dart';
import 'package:eventak/features/splash/presentation/screens/splash_screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(routes: [
  GoRoute(
    path: "/",
    builder: (context, state) => const SplashScreen(),
  ),
  GoRoute(
    path: "/OnBoardingView",
    builder: (context, state) => const OnBoardingView(),
  ),
  GoRoute(
    path: "/HomeScreen",
    builder: (context, state) => const HomeScreen(),
  ),
  GoRoute(
    path: "/ForgetPasswordScreen",
    builder: (context, state) => const ForgetPasswordScreen(),
  ),
  GoRoute(
    path: "/ResetPasswordScreen",
    builder: (context, state) => BlocProvider(
      create: (context) => sl<ResetPasswordCubit>(),
      child: const ResetPasswordScreen(),
    ),
  ),
  GoRoute(
    path: "/PassResetVerification",
    builder: (context, state) => const PassResetVerification(),
  ),
  GoRoute(
    path: "/BottomNavBar",
    builder: (context, state) => const BottomNavBar(),
  ),
  // GoRoute(
  //   path: "/CreateEventScreen",
  //   builder: (context, state) => const CreateEventScreen(),
  // ),
  GoRoute(
    path: "/PageViewEvent",
    builder: (context, state) =>const  PageViewEvent(),
  ),
  
  GoRoute(
    path: "/RegisterScreen",
    builder: (context, state) => BlocProvider(
      create: (context) => sl<RegisterCubit>(),
      child: const RegisterScreen(),
    ),
  ),
  GoRoute(
    path: "/SignIn",
    builder: (context, state) => BlocProvider(
      create: (context) => sl<SignInCubit>(),
      child: const SignIn(),
    ),
  ),
]);
