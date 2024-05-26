import 'package:eventak/core/utils/app_styles.dart';
import 'package:eventak/features/setting/presentation/widgets/custom_setting_container.dart';
import 'package:flutter/material.dart';

class FeaturesScreen extends StatelessWidget {
  const FeaturesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: const Color(0xfff4f4f4),
      appBar: AppBar(
        title: Text(
          "Features",
          style: AppStyles.styleBold18(context),
        ),
        centerTitle: true,
      ),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24 ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 24,),
                CustomSettingContainer(
                    title: 'Search Events',
                    subTitle:
                        'Easily find events by name, category, location, or date using the intuitive search feature.'),
                CustomSettingContainer(
                    title: 'Event Details',
                    subTitle:
                        'Access comprehensive event details including date, time, location, description, and organizer information.'),
                CustomSettingContainer(
                    title: 'Save Favorites',
                    subTitle:'Bookmark your favorite events for quick access and stay updated on upcoming activities.'),
                CustomSettingContainer(
                    title: 'Face ID Security',
                    subTitle:'Ensure event security with optional face ID verification for organizers and participants.'),
                CustomSettingContainer(
                    title: 'Create Events',
                    subTitle:"Organize your own events effortlessly with Eventak's user-friendly event creation tools."),
                CustomSettingContainer(
                    title: 'Participate',
                    subTitle:'Join events with ease and interact with organizers and fellow attendees.  '),
                CustomSettingContainer(
                    title: 'Event Trends',
                    subTitle:"Discover trending events and stay updated on the latest popular activities in your area and beyond."),
                CustomSettingContainer(
                    title:
                        'Ticket Purchasing',
                    subTitle:'Easily purchase tickets for paid events directly within the app for a seamless booking experience.'),
                CustomSettingContainer(
                    title:
                        'Multi-Language Support',
                    subTitle:'Enjoy Eventak in your preferred language with support for multiple languages for a global user base.'),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
