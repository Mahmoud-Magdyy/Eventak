
import 'package:eventak/core/utils/app_colors.dart';
import 'package:eventak/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class CustomNavBarDetailsScreen extends StatelessWidget {
  const CustomNavBarDetailsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 400,
      height: 101,
      padding: const EdgeInsets.only(
        top: 19,
        left: 16,
        right: 16,
        bottom: 24,
      ),
      clipBehavior: Clip.antiAlias,
      decoration: const ShapeDecoration(
        shape: RoundedRectangleBorder(
            side: BorderSide(color: AppColors.grey)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'price',
                  style: TextStyle(
                    color: Color(0xFF495154),
                    fontSize: 16,
                    fontFamily: 'Metropolis',
                    fontWeight: FontWeight.w500,
                    height: 0,
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text.rich(TextSpan(children: [
                  TextSpan(
                    text: '£20',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 28,
                      fontFamily: 'Metropolis',
                      fontWeight: FontWeight.w600,
                      height: 0,
                    ),
                  ),
                  TextSpan(
                    text: '/total',
                    style: TextStyle(
                      color: Color(0xFF495154),
                      fontSize: 14,
                      fontFamily: 'Metropolis',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  )
                ])),
              ],
            ),
          ),
          Expanded(
            child: CustomElevetedButton(
              text: 'Register',
              background: const Color(0xFF1561F3),
              onPressed: () {},
            ),
          ),
        ],
      ),
    );
  }
}
