import 'package:eventak/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';

class CustomElevetedButton extends StatelessWidget {
  const CustomElevetedButton({
    super.key, this.height=48, this.width=double.infinity, required this.onPressed, this.background, required this.text, this.color, this.borderColor, this.style, 
  });
  final double? height;
  final double? width;
  final VoidCallback onPressed;
  final Color? background;
  final String  text;
  final Color? color;
  final Color? borderColor;
  final TextStyle? style;
  // final Function(bool)? onFocusChange;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height!,
  width: width!,
      child: ElevatedButton(
        onPressed: onPressed,
        
        style: Theme.of(context)
            .elevatedButtonTheme
            .style!
            
            .copyWith(
              side:  MaterialStatePropertyAll(
                
                BorderSide(
                  
                  color:borderColor??Colors.transparent)),
                backgroundColor:
                     MaterialStatePropertyAll(
                      
                       background??AppColors.primaryColor)),
        child:  Text(text,style:style?? AppStyles.styleSemiBold18(context).copyWith(color: color),),
      ),
    );
  }
}
