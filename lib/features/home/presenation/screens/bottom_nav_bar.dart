import 'package:eventak/core/utils/app_colors.dart';
import 'package:eventak/features/create_event/presentation/screens/page_view_event.dart';
import 'package:eventak/features/home/presenation/home_cubit/home_cubit.dart';
import 'package:eventak/features/home/presenation/home_cubit/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Scaffold(
          body: context
              .read<HomeCubit>()
              .screens[context.read<HomeCubit>().currenIndex],
          bottomNavigationBar: BottomNavigationBar(
            iconSize: 24,
            // elevation: 0,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.home_outlined,
                ),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.event_note_outlined,
                ),
                label: 'My Events',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.add_box_outlined,
                ),
                label: 'Add',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.settings_outlined,
                ),
                label: 'Settings',
              ),
              BottomNavigationBarItem(
                icon: Icon(
                  Icons.account_circle_outlined,
                ),
                label: 'Profile',
              ),
            ],
            currentIndex: context.read<HomeCubit>().currenIndex,
            // backgroundColor: Colors.green,
            selectedItemColor: AppColors.primaryColor,
            unselectedItemColor: Colors.grey,
            mouseCursor: MouseCursor.defer,
            type: BottomNavigationBarType.fixed,

            onTap: (value) {
              if (value == 2) {
                // If "Add" is selected
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>const PageViewEvent()), // Navigate to your AddScreen
                );
              } else {
                context.read<HomeCubit>().changeIndex(value);
              }
            },
          ),
        );
      },
    );
  }
}
        //  PersistentTabView(
        //   context,
        //   screens: BlocProvider.of<HomeCubit>(context).screens,
        //   items: [
        //     PersistentBottomNavBarItem(
              
        //       icon: const Icon(Icons.home_outlined, ),
        //       title: ("Home"),
        //       activeColorPrimary: AppColors.colorCategoryName,
        //       inactiveColorPrimary: Colors.grey,
        //       // onPressed: (p0) {
        //       //   navigate(context: context, route: Routes.settingScreen);
        //       // },
        //       routeAndNavigatorSettings: RouteAndNavigatorSettings(
        //         // onGenerateRoute: (settings) {
        //         // return settings
        //         //   // return ;
        //         // },

                
        //         initialRoute: "/",
        //         routes: {
        //           Routes.searchScreen: (final context) =>
        //               const SearchScreen(),
        //         },
        //       ),
        //     ),
        //     PersistentBottomNavBarItem(
        //       icon: const Icon(Icons.event_note_outlined, ),
        //       title: ("My Events"),
        //       activeColorPrimary: AppColors.colorCategoryName,
        //       inactiveColorPrimary: Colors.grey,
        //     ),
        //     PersistentBottomNavBarItem(
        //       icon: const Icon(Icons.add_box_outlined, ),
        //       title: ("Create"),
        //       onPressed: (p0) {
        //         navigate(context: context, route: Routes.pageView);
        //       },
        //       activeColorPrimary: AppColors.colorCategoryName,
        //       inactiveColorPrimary: Colors.grey,
        //     ),
        //     PersistentBottomNavBarItem(
              
        //       routeAndNavigatorSettings: RouteAndNavigatorSettings(
        //         // initialRoute: "/",
        //         routes: {
        //           Routes.privacyAndSecurity: (final context) =>
        //               const PrivacyAndSecurity(),
        //           Routes.languageScreen: (final context) =>
        //               const LanguageScreen(),
        //         },
        //       ),
        //       icon: const Icon(Icons.settings_outlined, ),
        //       title: ("Settings"),
        //       activeColorPrimary: AppColors.colorCategoryName,
        //       inactiveColorPrimary: Colors.grey,
        //       // onPressed: (p0) => navigate(context: context, route: Routes.settingScreen),
        //     ),
        //     PersistentBottomNavBarItem(
        //       icon: const Icon(
        //         Icons.account_circle_outlined,
        //         ,
        //       ),
        //       title: ("profile"),
        //       activeColorPrimary: AppColors.colorCategoryName,
        //       inactiveColorPrimary: Colors.grey,
        //     ),
        //   ],
        //   confineInSafeArea: true,
        //   backgroundColor: Colors.white, // Default is Colors.white.
        //   handleAndroidBackButtonPress: true, // Default is true.
        //   resizeToAvoidBottomInset:
        //       true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
        //   stateManagement: true, // Default is true.
        //   hideNavigationBarWhenKeyboardShows:
        //       true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
        //   decoration: NavBarDecoration(
        //     borderRadius: BorderRadius.circular(10.0),
        //     colorBehindNavBar: Colors.white,
        //   ),
        //   popAllScreensOnTapOfSelectedTab: true,
        //   popActionScreens: PopActionScreensType.all,
        //   itemAnimationProperties: const ItemAnimationProperties(
        //     // Navigation Bar's items animation properties.
        //     duration: Duration(milliseconds: 200),
        //     curve: Curves.ease,
        //   ),

        //   screenTransitionAnimation: const ScreenTransitionAnimation(
        //     // Screen transition animation on change of selected tab.
        //     animateTabTransition: true,
        //     curve: Curves.ease,
        //     duration: Duration(milliseconds: 200),
        //   ),

        //   navBarStyle: NavBarStyle
        //       .style3, // Choose the nav bar style with this property.
        // );
      
  
  


// List<PersistentBottomNavBarItem> _navBarsItems() {
//   return [
//     PersistentBottomNavBarItem(
//       icon: const Icon(Icons.home_outlined, ),
//       title: ("Home"),
//       activeColorPrimary: AppColors.colorCategoryName,
//       inactiveColorPrimary: Colors.grey,
//     ),
//     PersistentBottomNavBarItem(
//       icon: const Icon(Icons.event_note_outlined, ),
//       title: ("My Events"),
//       activeColorPrimary: AppColors.colorCategoryName,
//       inactiveColorPrimary: Colors.grey,
//     ),
//     PersistentBottomNavBarItem(
//       icon: const Icon(Icons.add_box_outlined, ),
//       title: ("Create"),
//       onPressed: (p0) {
        
//       },
//       activeColorPrimary: AppColors.colorCategoryName,
//       inactiveColorPrimary: Colors.grey,
//     ),
//     PersistentBottomNavBarItem(
//       icon: const Icon(Icons.settings_outlined, ),
//       title: ("Settings"),
//       activeColorPrimary: AppColors.colorCategoryName,
//       inactiveColorPrimary: Colors.grey,
//     ),
//     PersistentBottomNavBarItem(
//       icon: const Icon(
//         Icons.account_circle_outlined,
//         ,
//       ),
//       title: ("profile"),
//       activeColorPrimary: AppColors.colorCategoryName,
//       inactiveColorPrimary: Colors.grey,
//     ),
//   ];
// }
