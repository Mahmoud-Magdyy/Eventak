import 'package:eventak/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff4f4f4),
      appBar: AppBar(
        title: Text(
          "Language",
          style: AppStyles.styleBold18(context),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Text(
              'INTERFACE LANGUAGE',
              style: AppStyles.styleMedium12(context),
            ),
            
          ],
        ),
      ),
    );
  }
}
