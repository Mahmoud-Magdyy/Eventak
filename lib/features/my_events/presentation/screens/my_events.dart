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
        if(state is DeleteEventLoadingState){
          const CircularProgressIndicator(backgroundColor: Colors.transparent,);
        }
      },
      builder: (context, state) {
        return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              leading: Container(),
              title: Text(
                'My Events',
                style: AppStyles.styleBold16(context).copyWith(fontSize: 18),
              ),
              centerTitle: true,
            ),
            body: DefaultTabController(
              length: 2,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Container(
                      height: 55,
                      decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      )),
                      child: TabBar(
                        labelColor: Colors.white,
                        dividerHeight: 0,
                        indicatorColor: Colors.transparent,
                        indicator: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: AppColors.primaryColor,
                        ),
                        tabs: const [
                          CustomTabBarButton(
                            text: 'Created',
                          ),
                          CustomTabBarButton(
                            text: 'Requested',
                          ),
                        ],
                      ),
                    ),
                     const Expanded(
                        child: TabBarView(children: [
                      Padding(
                          padding: EdgeInsets.all(8.0),
                          child: CreatedItemListView()),
                      Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Column(
                          children: [RequestedItemListView()],
                        ),
                      ),
                    ]))
                  ],
                ),
              ),
            ));
      },
    );
  }
}
