import 'package:flutter/material.dart';

class CreateEventScreen extends StatelessWidget {
  const CreateEventScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(onPressed: (){}, child: const Text('Cancel')),
                  const Text('My Event' ),
                  TextButton(onPressed: (){}, child: const Text('Next')),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}