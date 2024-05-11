import 'package:eventak/core/widgets/shimmer_container.dart';
import 'package:eventak/features/home/presenation/home_cubit/home_cubit.dart';
import 'package:eventak/features/home/presenation/home_cubit/home_state.dart';
import 'package:eventak/features/home/presenation/widgets/new_events/new_event_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class NewEventListView extends StatefulWidget {
  const NewEventListView({
    super.key,
  });

  @override
  State<NewEventListView> createState() => _NewEventListViewState();
}

class _NewEventListViewState extends State<NewEventListView> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        return context.read<HomeCubit>().events.isEmpty
            ? const Center(
                child: Text('No Events'),
              )
            : SizedBox(
                height: 400,
                child: ListView.builder(
                    itemCount: context.read<HomeCubit>().events.length,
                    itemBuilder: (context, index) {
                      return state is GetAllEventsLoadingState
                          ? Shimmer.fromColors(
                              baseColor: Colors.grey[500]!,
                              highlightColor: Colors.grey[600]!,
                              child: const ContainerShammer(),
                            )
                          : NewEeventItem(
                              onTapFavourit: () {
                                setState(() {
                                  context
                                          .read<HomeCubit>()
                                          .events[index]
                                          .isSelectedFavoriteIcon =
                                      !context
                                          .read<HomeCubit>()
                                          .events[index]
                                          .isSelectedFavoriteIcon;
                                  print(context
                                          .read<HomeCubit>()
                                          .events[index]
                                          .id);
                                });
                                
                                // context
                                //     .read<HomeCubit>()
                                //     .changeFavoriteIcon(index);
                              },
                              allEventModel:
                                  context.read<HomeCubit>().events[index],
                            );
                    }),
              );
      },
    );
  }
}
