import 'package:eventak/core/functions/commns.dart';
import 'package:eventak/core/utils/app_colors.dart';
import 'package:eventak/features/home/presenation/home_cubit/home_cubit.dart';
import 'package:eventak/features/my_events/presentation/cubits/my_created_events_cubit.dart';
import 'package:eventak/features/my_events/presentation/cubits/my_created_events_state.dart';
import 'package:eventak/features/my_events/presentation/widgets/custom_container_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class CreatedItemListView extends StatefulWidget {
  const CreatedItemListView({
    super.key,
  });

  @override
  State<CreatedItemListView> createState() => _CreatedItemListViewState();
}

class _CreatedItemListViewState extends State<CreatedItemListView> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MyCreatedEventsCubit, MyCreatedEventsState>(
      listener: (context, state) {
        if (state is DeleteEventSuccessState) {
          showTwist(
              state: ToastStates.success, messege: state.message);
          setState(() {
            
          });
        }
          if (state is DeleteEventErrorState) {
          showTwist(
              state: ToastStates.error, messege: 'Failed to Delete Event');
        }
      },
      builder: (context, state) {
        return context.read<HomeCubit>().events.isEmpty
            ? const Center(
                child: Text('No Created Events'),
              )
            : ListView.builder(
                shrinkWrap: true,
                itemCount: context
                    .read<MyCreatedEventsCubit>()
                    .myCreatedEventList
                    .length,
                itemBuilder: (context, index) {
                  return state is GetMyCreatedEventsLoadingState
                      ? Shimmer.fromColors(
                          baseColor: Colors.grey[500]!,
                          highlightColor: Colors.grey[200]!,
                          child: Container(
                            decoration: ShapeDecoration(
                              color: AppColors.grey,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                            ),
                            margin: const EdgeInsets.all(8),
                            width: 329,
                            height: 160,
                          ),
                        )
                      : CustomMyCreatedEventItemList(
                          myCreatedEventModel: context
                              .read<MyCreatedEventsCubit>()
                              .myCreatedEventList[index],
                        );
                });
      },
    );
  }
}
