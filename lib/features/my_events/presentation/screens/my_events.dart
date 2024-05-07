import 'package:eventak/core/utils/app_styles.dart';
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
      body: const CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            
          )
        ],
      ),
    );
  }
}

