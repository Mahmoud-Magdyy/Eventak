import 'package:eventak/features/auth/presentation/screens/forget_password_screen.dart';
import 'package:eventak/features/auth/presentation/screens/pass_reset_verficiton.dart';
import 'package:eventak/features/auth/presentation/screens/register_screen.dart';
import 'package:eventak/features/auth/presentation/screens/reset_password_screen.dart';
import 'package:eventak/features/auth/presentation/screens/sign_in_screen.dart';
import 'package:eventak/features/create_event/presentation/screens/page_view_event.dart';
import 'package:eventak/features/home/presenation/screens/bottom_nav_bar.dart';
import 'package:eventak/features/home/presenation/widgets/search/presentation/screens/search.dart';
import 'package:eventak/features/my_events/data/models/my_event_model.dart';
import 'package:eventak/features/my_events/presentation/screens/edit_event_screen.dart';
import 'package:eventak/features/my_events/presentation/widgets/request_screen.dart';
import 'package:eventak/features/on_borading/presentation/screens/on_boarding_view.dart';
import 'package:eventak/features/profile/presentation/screens/edit_profile_screen.dart';
import 'package:eventak/features/profile/presentation/screens/favourite_screen.dart';
import 'package:eventak/features/setting/presentation/screens/faq_screen.dart';
import 'package:eventak/features/setting/presentation/screens/features_screen.dart';
import 'package:eventak/features/setting/presentation/screens/language_screen.dart';
import 'package:eventak/features/setting/presentation/screens/privcy_screen.dart';
import 'package:eventak/features/setting/presentation/screens/setting_screen.dart';
import 'package:eventak/features/splash/presentation/screens/splash_screen.dart';
import 'package:flutter/material.dart';
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
  static const String editProfileScreen='/editProfileScreen';
  static const String requestsScreen='/requestsScreen';
  static const String editEventScreen='/editEventScreen';
  static const String favoritesScreen='/favoritesScreen';
  static const String faqScreen='/faqScreen';
  static const String featuresScreen='/featuresScreen';
}

class AppRoutes {
  
  static Route? generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case Routes.onBoardingView:
        return MaterialPageRoute(builder: (_) => const OnBoardingView());
      case Routes.faqScreen:
        return MaterialPageRoute(builder: (_) => const FaqScreen());
      case Routes.featuresScreen:
        return MaterialPageRoute(builder: (_) => const FeaturesScreen());
      case Routes.editProfileScreen:
        return MaterialPageRoute(builder: (_) => const EditProfileScreen());
      case Routes.favoritesScreen:
        return MaterialPageRoute(builder: (_) => const FavoritesScreen());
      case Routes.editEventScreen:
        return MaterialPageRoute(builder: (_) =>   EditEventScreen( myCreatedEventModel: routeSettings.arguments as MyCreatedEventModel,));
      case Routes.requestsScreen:
        return MaterialPageRoute(builder: (_) => const RequestsScreen());
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
