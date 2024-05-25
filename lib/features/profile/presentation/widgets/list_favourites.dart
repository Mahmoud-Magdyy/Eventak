import 'package:eventak/core/utils/app_colors.dart';
import 'package:eventak/features/home/presenation/home_cubit/home_cubit.dart';
import 'package:eventak/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:eventak/features/profile/presentation/cubit/profile_state.dart';
import 'package:eventak/features/profile/presentation/widgets/custom_favourite_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';

class FavouriteList extends StatefulWidget {
  const FavouriteList({
    super.key,
  });

  @override
  State<FavouriteList> createState() => _FavouriteListState();
}

class _FavouriteListState extends State<FavouriteList> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        // if(state is GetMyFavouriteEventsLoadingState){
        //   const CircularProgressIndicator();
        // }
      },
      builder: (context, state) {
        return context.read<HomeCubit>().events.isEmpty
            ? const Center(
                child: Text('No Favourite Events'),
              )
            : ListView.builder(
                shrinkWrap: true,
                // physics: const NeverScrollableScrollPhysics(),
                itemCount:
                    context.read<ProfileCubit>().myFavouriteEventList.length,
                itemBuilder: (context, index) {
                  return state is GetMyFavouriteEventsLoadingState
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
                      : CustomFavouriteItem(
                          myFavouriteModel: context
                              .read<ProfileCubit>()
                              .myFavouriteEventList[index],
                        );
                });
      },
    );
  }
}
