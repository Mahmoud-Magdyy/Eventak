import 'package:eventak/core/widgets/custom_button.dart';
import 'package:eventak/features/create_event/presentation/cubit/create_event_cubit.dart';
import 'package:eventak/features/create_event/presentation/cubit/create_event_state.dart';
import 'package:eventak/features/create_event/presentation/screens/create_event_page_one.dart';
import 'package:eventak/features/create_event/presentation/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PageViewEvent extends StatelessWidget {
  PageViewEvent({super.key});
  final PageController controller = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SafeArea(
          child: BlocConsumer<CreateEventCubit, CreateEventState>(
            listener: (context, state) {},
            builder: (context, state) {
              final CreateEventCubit createCubit =
                  BlocProvider.of<CreateEventCubit>(context);
              return Form(
                key: createCubit.formKey,
                child: Column(
                  children: [
                    CustomCreateEventAppBar(
                      nextOnPressed: () {
                        controller.jumpToPage(2);
                      },
                    ),
                    Expanded(
                      child: PageView(
                        // physics: const NeverScrollableScrollPhysics(),
                        controller: controller,
                        children: [
                          CreateEventPageOne(createCubit: createCubit)
                        ],
                      ),
                    ),
                    // const Expanded(child: SizedBox()),
                    CustomElevetedButton(onPressed: () {}, text: 'Publish')
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
