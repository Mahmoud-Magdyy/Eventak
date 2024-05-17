import 'package:eventak/core/utils/app_styles.dart';
import 'package:flutter/material.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Edit Profile",
          style: AppStyles.styleBold18(context),
        ),
        centerTitle: true,
      ),
      body: const Column(
        children: [
          SizedBox(height: 48,),
          
        ],
      ),
    );
  }
}