import 'package:eventak/core/widgets/shimmer_container.dart';
import 'package:eventak/features/home/presenation/home_cubit/home_cubit.dart';
import 'package:eventak/features/my_events/presentation/cubit/my_created_events_cubit.dart';
import 'package:eventak/features/my_events/presentation/cubit/my_created_events_state.dart';
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
    return BlocConsumer<MyCreatedEventsCubit,MyCreatedEventsState>(
      listener: (context, state) {},
      builder: (context, state) {
        return context.read<HomeCubit>().events.isEmpty
            ? const Center(
                child: Text('No Created Events'),
              )
            : ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: context.read<MyCreatedEventsCubit>().myCreatedEventList.length,
                itemBuilder: (context, index) {
                  return state is GetMyCreatedEventsLoadingState
                      ? Shimmer.fromColors(
                          baseColor: Colors.grey[500]!,
                          highlightColor: Colors.grey[600]!,
                          child: const ContainerShammer(),
                        )
                      : CustomMyCreatedEventItemList(
                        deleteOnPressed: () {
                          // context.read<MyCreatedEventsCubit>().deleteEvent(id)
                        },
                          myCreatedEventModel:
                              context.read<MyCreatedEventsCubit>().myCreatedEventList[index],
                              
                        );
                        
                });
      },
    );
  }
}
