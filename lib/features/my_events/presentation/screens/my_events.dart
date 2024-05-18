import 'package:eventak/core/utils/app_colors.dart';
import 'package:eventak/core/utils/app_styles.dart';
import 'package:eventak/core/widgets/custom_button.dart';
import 'package:eventak/features/my_events/presentation/widgets/custom_image.dart';
import 'package:eventak/features/my_events/presentation/widgets/custom_tab_bar_button.dart';
import 'package:eventak/features/my_events/presentation/widgets/title_and_sub_title.dart';
import 'package:flutter/material.dart';

class MyEvents extends StatelessWidget {
  const MyEvents({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text(
            'My Events',
            style: AppStyles.styleBold16(context).copyWith(fontSize: 18),
          ),
          centerTitle: true,
        ),
        body: DefaultTabController(
          length: 2,
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Container(
                  height: 55,
                  decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  )),
                  child: TabBar(
                    labelColor: Colors.white,
                    dividerHeight: 0,
                    indicatorColor: Colors.transparent,
                    indicator: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: AppColors.primaryColor,
                    ),
                    tabs: const [
                      CustomTabBarButton(
                        text: 'Created',
                      ),
                      CustomTabBarButton(
                        text: 'Discard',
                      ),
                    ],
                  ),
                ),
                Expanded(
                    child: TabBarView(children: [
                  const Text('created'),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          // width: 329,
                          // height: 160,
                          clipBehavior: Clip.antiAlias,
                          decoration: ShapeDecoration(
                            color: Colors.grey.shade200,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          child: Column(
                            children: [
                            const  Row(
                                children: [
                                  CustomImageOfEvent(),
                                   SizedBox(
                                    width: 16,
                                  ),
                                   TitleAndSubTitleOfEvent()
                                ],
                              ),
                              const SizedBox(height: 16,),
                              Row(
                                children: [
                                  Expanded(child: CustomElevetedButton(onPressed: (){}, text: 'Delete'),),
                                  const SizedBox(width: 16,),
                                  Expanded(child: CustomElevetedButton(onPressed: (){}, text: 'Edit'),),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ]))
              ],
            ),
          ),
        ));
  }
}
