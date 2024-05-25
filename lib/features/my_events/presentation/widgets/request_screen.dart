import 'package:eventak/features/home/presenation/home_cubit/home_cubit.dart';
import 'package:eventak/features/my_events/presentation/cubits/my_created_events_cubit.dart';
import 'package:eventak/features/my_events/presentation/cubits/my_created_events_state.dart';
import 'package:eventak/features/my_events/presentation/widgets/custom_user_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RequestsScreen extends StatelessWidget {
  const RequestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff4f4f4),
      appBar: AppBar(
        title: const Text('Requests'),
        centerTitle: true,
      ),
      body:  Padding(
        padding: const EdgeInsets.all(16),
        child: BlocConsumer<MyCreatedEventsCubit, MyCreatedEventsState>(
          listener: (context, state) {
          },
          builder: (context, state) {
            return context.read<HomeCubit>().events.isEmpty
            ? const Center(
                child: Text('No Requested Yet'),
              )
            : 
            state is GetUsersLoadingState
                      ? const Center(child: CircularProgressIndicator())
                      :
            ListView.builder(
                shrinkWrap: true,
                // physics: const NeverScrollableScrollPhysics(),
                itemCount: context.read<MyCreatedEventsCubit>().usersEventList.length,
                itemBuilder: (context, index) {
                  return  CustomRequestItem(

                          userModel:
                              context.read<MyCreatedEventsCubit>().usersEventList[index],
                              
                        );
                        
                });
          },
        ),
      ),
    );
  }
}
