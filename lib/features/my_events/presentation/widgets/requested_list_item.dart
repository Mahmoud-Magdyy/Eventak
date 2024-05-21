import 'package:eventak/core/widgets/shimmer_container.dart';
import 'package:eventak/features/home/presenation/home_cubit/home_cubit.dart';
import 'package:eventak/features/my_events/presentation/cubit/my_created_events_cubit.dart';
import 'package:eventak/features/my_events/presentation/cubit/my_created_events_state.dart';
import 'package:eventak/features/my_events/presentation/widgets/custom_request_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class RequestedItemListView extends StatefulWidget {
  const RequestedItemListView({
    super.key,
  });

  @override
  State<RequestedItemListView> createState() => _RequestedItemListViewState();
}

class _RequestedItemListViewState extends State<RequestedItemListView> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MyCreatedEventsCubit,MyCreatedEventsState>(
      listener: (context, state) {
        // if (state is DeleteEventSuccessState) {
        //   setState(() {}); 
        // }
      },
      builder: (context, state) {
        return context.read<HomeCubit>().events.isEmpty
            ? const Center(
                child: Text('No Requested Events'),
              )
            : ListView.builder(
                shrinkWrap: true,
                // physics: const NeverScrollableScrollPhysics(),
                itemCount: context.read<MyCreatedEventsCubit>().requestedMyEventList.length,
                itemBuilder: (context, index) {
                  return state is GetRequestedMyEventsLoadingState
                      ? Shimmer.fromColors(
                          baseColor: Colors.grey[500]!,
                          highlightColor: Colors.grey[600]!,
                          child: const ContainerShammer(),
                        )
                      : CustomRequestedEventItemList(
                      
                        
                          myRequestedEventModel:
                              context.read<MyCreatedEventsCubit>().requestedMyEventList[index],
                              
                        );
                        
                });
      },
    );
  }
}
