import 'package:eventak/core/functions/commns.dart';
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
      listener: (context, state) {
        if (state is AddToFavouritSuccessState) {
          showTwist(state: ToastStates.success, messege: 'Added To Favourite');
        } else if (state is RemoveFromFavouritSuccessState) {
          showTwist(
              state: ToastStates.success, messege: 'Removed From Favourite');
        } else if (state is AddToFavouritErrorState) {
          showTwist(state: ToastStates.error, messege: state.message);
        } else if (state is RemoveFromFavouritErrorState) {
          showTwist(state: ToastStates.error, messege: state.message);
        }
      },
      builder: (context, state) {
        return state is GetAllEventsLoadingState
            ? Shimmer.fromColors(
                baseColor: Colors.grey[500]!,
                highlightColor: Colors.grey[600]!,
                child: const ContainerShammer(),
              )
            : ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: context.read<HomeCubit>().events.length,
                itemBuilder: (context, index) {
                  return NewEeventItem(
                    onTapFavourit: () async {
                      context.read<HomeCubit>().toggleFavorite(
                          context.read<HomeCubit>().events[index]);
                    },
                    allEventModel: context.read<HomeCubit>().events[index],
                  );
                });
      },
    );
  }
}
