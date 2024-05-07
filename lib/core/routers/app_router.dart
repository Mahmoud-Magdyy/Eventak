import 'package:eventak/features/auth/presentation/screens/forget_password_screen.dart';
import 'package:eventak/features/auth/presentation/screens/pass_reset_verficiton.dart';
import 'package:eventak/features/auth/presentation/screens/register_screen.dart';
import 'package:eventak/features/auth/presentation/screens/reset_password_screen.dart';
import 'package:eventak/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:eventak/features/create_event/presentation/screens/page_view_event.dart';
import 'package:eventak/features/home/presenation/screens/bottom_nav_bar.dart';
import 'package:eventak/features/home/presenation/widgets/search/presentation/screens/search.dart';
import 'package:eventak/features/on_borading/presentation/screens/on_boarding_view.dart';
import 'package:eventak/features/setting/presentation/screens/language_screen.dart';
import 'package:eventak/features/setting/presentation/screens/privcy_screen.dart';
import 'package:eventak/features/setting/presentation/screens/setting_screen.dart';
import 'package:eventak/features/splash/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';

// final GoRouter router = GoRouter(routes: [
//   GoRoute(
//     path: "/",
//     builder: (context, state) => const SplashScreen(),
//   ),
//   GoRoute(
//     path: "/OnBoardingView",
//     builder: (context, state) => const OnBoardingView(),
//   ),
//   GoRoute(
//     path: "/HomeScreen",
//     builder: (context, state) => const HomeScreen(),
//   ),
//   GoRoute(
//     path: "/ForgetPasswordScreen",
//     builder: (context, state) => const ForgetPasswordScreen(),
//   ),
//   GoRoute(
//     path: "/ResetPasswordScreen",
//     builder: (context, state) => BlocProvider(
//       create: (context) => sl<ResetPasswordCubit>(),
//       child: const ResetPasswordScreen(),
//     ),
//   ),
//   GoRoute(
//     path: "/PassResetVerification",
//     builder: (context, state) => const PassResetVerification(),
//   ),
//   GoRoute(
//     path: "/BottomNavBar",
//     builder: (context, state) => const BottomNavBar(),
//   ),
//   // GoRoute(
//   //   path: "/CreateEventScreen",
//   //   builder: (context, state) => const CreateEventScreen(),
//   // ),
//   GoRoute(
//     path: "/PageViewEvent",
//     builder: (context, state) =>const  PageViewEvent(),
//   ),
//   // GoRoute(
//   //   path: "/NewEeventDetails",
//   //   builder: (context, state) =>const  NewEeventDetails(),
//   // ),

//   GoRoute(
//     path: "/RegisterScreen",
//     builder: (context, state) => BlocProvider(
//       create: (context) => sl<RegisterCubit>(),
//       child: const RegisterScreen(),
//     ),
//   ),
//   GoRoute(
//     path: "/SignIn",
//     builder: (context, state) => BlocProvider(
//       create: (context) => sl<SignInCubit>(),
//       child: const SignIn(),
//     ),
//   ),
// ]);
//!new
class Routes {
  static const String initialRoute = '/';
  static const String onBoardingView = '/onBoardingView';
  static const String pageView = '/pageView';

  static const String signIn = '/signIn';
  static const String registerScreen = '/registerScreen';
  static const String resetPassword = '/resetPassword';
  static const String forgetPassword = '/forgetPassword';
  static const String bottomNavBar = '/bottomNavBar';
  static const String passResetVerification = '/passResetVerification';
  static const String privacyAndSecurity = '/privacyAndSecurity';
  static const String settingScreen = '/settingScreen';
  static const String languageScreen= '/languageScreen';
  static const String searchScreen= '/searchScreen';
}

class AppRoutes {
  static Route? generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.onBoardingView:
        return MaterialPageRoute(builder: (_) => const OnBoardingView());
      case Routes.signIn:
        return MaterialPageRoute(builder: (_) => const SignIn());
      case Routes.languageScreen:
        return MaterialPageRoute(builder: (_) => const LanguageScreen());
      case Routes.searchScreen:
        return MaterialPageRoute(builder: (_) => const SearchScreen());
      case Routes.privacyAndSecurity:
        return MaterialPageRoute(builder: (_) => const PrivacyAndSecurity());
      case Routes.pageView:
        return MaterialPageRoute(builder: (_) => const PageViewEvent());
      case Routes.settingScreen:
        return MaterialPageRoute(builder: (_) => const SettingScreen());
      case Routes.passResetVerification:
        return MaterialPageRoute(builder: (_) => const PassResetVerification());
      case Routes.bottomNavBar:
        return MaterialPageRoute(builder: (_) => const BottomNavBar());
      case Routes.registerScreen:
        return MaterialPageRoute(builder: (_) => const RegisterScreen());
      case Routes.resetPassword:
        return MaterialPageRoute(builder: (_) => const ResetPasswordScreen());
      case Routes.forgetPassword:
        return MaterialPageRoute(builder: (_) => const ForgetPasswordScreen());
      default:
        return MaterialPageRoute(
            builder: (_) => const Scaffold(
                  body: Center(
                    child: Text('No Found Route'),
                  ),
                ));
    }
  }
}
