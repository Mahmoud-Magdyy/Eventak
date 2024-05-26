import 'package:eventak/core/functions/commns.dart';
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
            if(state is AcceptRequestSuccessState){
              showTwist(
              state: ToastStates.success, messege: state.message);
            }
            if(state is DeclineRequestSuccessState){
              showTwist(
              state: ToastStates.success, messege: state.message);
            }
          },
          builder: (context, state) {
             var users = context.read<MyCreatedEventsCubit>().usersEventList;
            return context.read<HomeCubit>().events.isEmpty
            ? const Center(
                child: Text('No Requested Yet'),
              )
            : 
            state is GetUsersLoadingState
                      ? const Center(child: CircularProgressIndicator())
                      :
            ListView.builder(
          itemCount: users.length,
          itemBuilder: (context, index) {
            return CustomRequestItem(
              userModel: users[index],
              onRemove: () {
                context.read<MyCreatedEventsCubit>().removeUserFromList(users[index].email);
              },
            );
          },
          );},
      ),
    ));
  }
}
