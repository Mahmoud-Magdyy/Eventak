import 'package:eventak/core/functions/commns.dart';
import 'package:eventak/core/utils/app_colors.dart';
import 'package:eventak/core/utils/app_styles.dart';
import 'package:eventak/features/my_events/presentation/cubits/my_created_events_cubit.dart';
import 'package:eventak/features/my_events/presentation/cubits/my_created_events_state.dart';
import 'package:eventak/features/my_events/presentation/widgets/created_list_item.dart';
import 'package:eventak/features/my_events/presentation/widgets/custom_tab_bar_button.dart';
import 'package:eventak/features/my_events/presentation/widgets/requested_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyEvents extends StatelessWidget {
  const MyEvents({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MyCreatedEventsCubit, MyCreatedEventsState>(
      listener: (context, state) {
        if (state is DeleteEventSuccessState) {
          showTwist(state: ToastStates.success, messege: state.message);
        }
        if (state is DeleteEventErrorState) {
          showTwist(state: ToastStates.error, messege: 'Failed to Delete Event');
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: const Color(0xfff4f4f4),
          appBar: AppBar(
            leading: Container(),
            title: Text(
              'My Events',
              style: AppStyles.styleBold16(context).copyWith(fontSize: 18),
            ),
            centerTitle: true,
          ),
          body: Stack(
            children: [
              DefaultTabController(
                length: 2,
                child: Padding(
                  padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
                  child: Column(
                    children: [
                      Container(
                        height: 55,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: TabBar(
                          overlayColor: const MaterialStatePropertyAll( Colors.transparent),
                          labelColor: Colors.white,
                          dividerColor: Colors.transparent,
                          indicatorColor: Colors.transparent,
                          indicator: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: AppColors.blue,
                          ),
                          indicatorWeight: 1,
                          tabs: const [
                            CustomTabBarButton(text: 'Created'),
                            CustomTabBarButton(text: 'Requested'),
                          ],
                        ),
                      ),
                      const Expanded(
                        child: TabBarView(
                          children: [
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: CreatedItemListView(),
                            ),
                            Padding(
                              padding: EdgeInsets.all(8.0),
                              child: RequestedItemListView(),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              if (state is GetMyCreatedEventsLoadingState ||
                  state is GetRequestedMyEventsLoadingState)
                const Center(
                  child: CircularProgressIndicator(
                    color: AppColors.primaryColor,
                  ),
                ),
              if (state is DeleteEventLoadingState)
                Container(
                  color: Colors.grey.withOpacity(0.2),
                  child: const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
