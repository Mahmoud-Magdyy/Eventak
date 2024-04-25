import 'package:eventak/core/functions/navigate.dart';
import 'package:eventak/core/utils/app_colors.dart';
import 'package:eventak/features/home/presenation/home_cubit/home_cubit.dart';
import 'package:eventak/features/home/presenation/home_cubit/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return PersistentTabView(
          context,
          screens: BlocProvider.of<HomeCubit>(context).screens,
          items: [
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.home_outlined, size: 24),
      title: ("Home"),
      activeColorPrimary: AppColors.colorCategoryName,
      inactiveColorPrimary: Colors.grey,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.event_note_outlined, size: 24),
      title: ("My Events"),
      activeColorPrimary: AppColors.colorCategoryName,
      inactiveColorPrimary: Colors.grey,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.add_box_outlined, size: 24),
      title: ("Create"),
      onPressed: (p0) {
        customNavigate(context, '/CreateEventScreen');
      },
      activeColorPrimary: AppColors.colorCategoryName,
      inactiveColorPrimary: Colors.grey,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(Icons.settings_outlined, size: 24),
      title: ("Settings"),
      activeColorPrimary: AppColors.colorCategoryName,
      inactiveColorPrimary: Colors.grey,
    ),
    PersistentBottomNavBarItem(
      icon: const Icon(
        Icons.account_circle_outlined,
        size: 24,
      ),
      title: ("profile"),
      activeColorPrimary: AppColors.colorCategoryName,
      inactiveColorPrimary: Colors.grey,
    ),
  ],
          confineInSafeArea: true,
          backgroundColor: Colors.white, // Default is Colors.white.
          handleAndroidBackButtonPress: true, // Default is true.
          resizeToAvoidBottomInset:
              true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
          stateManagement: true, // Default is true.
          hideNavigationBarWhenKeyboardShows:
              true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
          decoration: NavBarDecoration(
            borderRadius: BorderRadius.circular(10.0),
            colorBehindNavBar: Colors.white,
          ),
          popAllScreensOnTapOfSelectedTab: true,
          popActionScreens: PopActionScreensType.all,
          itemAnimationProperties: const ItemAnimationProperties(
            // Navigation Bar's items animation properties.
            duration: Duration(milliseconds: 200),
            curve: Curves.ease,
          ),

          screenTransitionAnimation: const ScreenTransitionAnimation(
            // Screen transition animation on change of selected tab.
            animateTabTransition: true,
            curve: Curves.ease,
            duration: Duration(milliseconds: 200),
          ),

          navBarStyle: NavBarStyle
              .style3, // Choose the nav bar style with this property.
        );
      },
    );
  }
}

// List<PersistentBottomNavBarItem> _navBarsItems() {
//   return [
//     PersistentBottomNavBarItem(
//       icon: const Icon(Icons.home_outlined, size: 24),
//       title: ("Home"),
//       activeColorPrimary: AppColors.colorCategoryName,
//       inactiveColorPrimary: Colors.grey,
//     ),
//     PersistentBottomNavBarItem(
//       icon: const Icon(Icons.event_note_outlined, size: 24),
//       title: ("My Events"),
//       activeColorPrimary: AppColors.colorCategoryName,
//       inactiveColorPrimary: Colors.grey,
//     ),
//     PersistentBottomNavBarItem(
//       icon: const Icon(Icons.add_box_outlined, size: 24),
//       title: ("Create"),
//       onPressed: (p0) {
        
//       },
//       activeColorPrimary: AppColors.colorCategoryName,
//       inactiveColorPrimary: Colors.grey,
//     ),
//     PersistentBottomNavBarItem(
//       icon: const Icon(Icons.settings_outlined, size: 24),
//       title: ("Settings"),
//       activeColorPrimary: AppColors.colorCategoryName,
//       inactiveColorPrimary: Colors.grey,
//     ),
//     PersistentBottomNavBarItem(
//       icon: const Icon(
//         Icons.account_circle_outlined,
//         size: 24,
//       ),
//       title: ("profile"),
//       activeColorPrimary: AppColors.colorCategoryName,
//       inactiveColorPrimary: Colors.grey,
//     ),
//   ];
// }
