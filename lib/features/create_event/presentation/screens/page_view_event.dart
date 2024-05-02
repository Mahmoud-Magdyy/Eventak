import 'package:eventak/core/utils/app_colors.dart';
import 'package:eventak/core/widgets/custom_button.dart';
import 'package:eventak/features/create_event/presentation/cubit/create_event_cubit.dart';
import 'package:eventak/features/create_event/presentation/cubit/create_event_state.dart';
import 'package:eventak/features/create_event/presentation/screens/create_event_page_four.dart';
import 'package:eventak/features/create_event/presentation/screens/create_event_page_one.dart';
import 'package:eventak/features/create_event/presentation/screens/create_event_page_three.dart';
import 'package:eventak/features/create_event/presentation/screens/create_event_page_two.dart';
import 'package:eventak/features/create_event/presentation/screens/page_one_widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PageViewEvent extends StatefulWidget {
  const PageViewEvent({super.key});

  @override
  State<PageViewEvent> createState() => _PageViewEventState();
}

class _PageViewEventState extends State<PageViewEvent> {
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
              List<Widget> screens = [
                CreateEventPageOne(
                  createCubit: createCubit,
                ),
                const CreateEventPageTwo(),
                const CreateEventPageThree(),
                const CreateEventPageFour(),
              ];

              return Form(
                key: createCubit.formKey,
                child: Column(
                  children: [
                    CustomCreateEventAppBar(
                      nextOnPressed: () {
                        controller.nextPage(
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.ease);
                      },
                    ),
                    Expanded(
                      child: PageView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: screens.length,
                        itemBuilder: (context, index) {
                          createCubit.page=index;
                          return screens[index];
                        },
                        controller: controller,
                      ),
                    ),
                    // const Expanded(child: SizedBox()),
                    CustomElevetedButton(
                        background: createCubit.checkBoxValue != true
                            ? Colors.grey
                            : AppColors.primaryColor,
                        onPressed: () {
                          
                        },
                        text: 'Publish'),
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
