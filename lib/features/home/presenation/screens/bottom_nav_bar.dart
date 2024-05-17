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

