import 'package:eventak/core/utils/app_colors.dart';
import 'package:eventak/core/utils/app_styles.dart';
import 'package:eventak/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class MyEvents extends StatelessWidget {
  const MyEvents({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'My Events',
          style: AppStyles.styleBold16(context).copyWith(fontSize: 18),
        ),
        centerTitle: true,
      ),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            pinned: true,
            title: Center(
              child:
               Container(
                  color: AppColors.grey,
                  // height: 100,
                  // width: double.infinity,
                  padding: const EdgeInsets.all(24),
                  child: FittedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomElevetedButton(
                          onPressed: () {},
                          text: 'Created',
                          background:Colors.white ,
                          
                          
                          width: 169,
                          height: 60,
                        ),
                        const SizedBox(
                          width: 8,
                        ),
                        CustomElevetedButton(
                          onPressed: () {},
                          text: 'Draft',
                          width: 169,
                          height: 60,
                        ),
                      ],
                    ),
                  )),
            ),
          ),
          
        ],
      ),
    );
  }
}
