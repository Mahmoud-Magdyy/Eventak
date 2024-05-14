import 'package:eventak/core/functions/navigate.dart';
import 'package:eventak/core/routers/app_router.dart';
import 'package:eventak/core/utils/app_colors.dart';
import 'package:eventak/core/widgets/custom_button.dart';
import 'package:eventak/features/create_event/presentation/cubit/create_event_cubit.dart';
import 'package:eventak/features/create_event/presentation/cubit/create_event_state.dart';
import 'package:eventak/features/create_event/presentation/screens/create_event_page_four.dart';
import 'package:eventak/features/create_event/presentation/screens/create_event_page_one.dart';
import 'package:eventak/features/create_event/presentation/screens/create_event_page_three.dart';
import 'package:eventak/features/create_event/presentation/screens/create_event_page_two.dart';
import 'package:eventak/features/create_event/presentation/screens/page_one_widgets/custom_app_bar.dart';
import 'package:eventak/features/home/presenation/home_cubit/home_cubit.dart';
import 'package:eventak/features/home/presenation/home_cubit/home_state.dart';
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
        child: BlocBuilder<HomeCubit, HomeState>(
          builder: (context, state) {
            return SafeArea(
              child: BlocConsumer<CreateEventCubit, CreateEventState>(
                listener: (context, state) {
                  if (state is CretaeEventSuccessState) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(const SnackBar(content: Text('Success')));
                    navigateReplacment(
                        context: context, route: Routes.bottomNavBar);
                    BlocProvider.of<HomeCubit>(context).getAllEvents();
                  } else if (state is CretaeEventErrorState) {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(const SnackBar(content: Text('Error')));
                  }
                },
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
                          backOnPressed: () {
                            controller.page == 0
                                ? navigateReplacment(
                                    context: context,
                                    route: Routes.bottomNavBar)
                                : controller.previousPage(
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.ease);
                          },
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
                              createCubit.page = index;
                              return screens[index];
                            },
                            controller: controller,
                          ),
                        ),
                        // const Expanded(child: SizedBox()),
                        state is CretaeEventLoadingState
                            ? const Center(
                                child: CircularProgressIndicator(
                                color: AppColors.primaryColor,
                              ))
                            : CustomElevetedButton(
                                background: createCubit.checkBoxValue != true
                                    ? Colors.grey
                                    : AppColors.primaryColor,
                                onPressed: () {
                                  createCubit.createEvent();
                                  // createCubit.sendPgosOfEvent(context.read<CreateEventCubit>().multipartFiles);
                                },
                                text: 'Publish'),
                      ],
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
