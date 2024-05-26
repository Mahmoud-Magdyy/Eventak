import 'package:eventak/core/utils/app_styles.dart';
import 'package:eventak/features/setting/presentation/widgets/custom_setting_container.dart';
import 'package:flutter/material.dart';

class FaqScreen extends StatelessWidget {
  const FaqScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: const Color(0xfff4f4f4),
      appBar: AppBar(
        // backgroundColor: Colors.white,
        title: Text(
          "FAQ",
          style: AppStyles.styleBold18(context),
        ),
        centerTitle: true,
      ),
      body: const SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24,),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 24,),
                CustomSettingContainer(
                  title: 'What is Eventak?',
                  subTitle:
                      'Eventak is an event management system application that allows users to create, discover, and participate in a wide range of events. Whether youre planning a gathering or looking for exciting activities to attend, Eventak has you covered.',
                ),
                CustomSettingContainer(
                  title: 'How can I create an event on Eventak?',
                  subTitle:
                      'To create an event on Eventak, simply navigate to the "Create New Event" page and fill out the required details, including the event title, date, time, location, description, and category. Once you have entered all the necessary information, you can publish your event for others to discover and participate in.',
                ),
                CustomSettingContainer(title: 'Can I search for events on Eventak?', subTitle: 'Yes, you can search for events on Eventak by name. Simply enter the name of the event in the search bar, and relevant results will be displayed. You can tap on the event from the search section to navigate to the event page. Additionally, you can set the event as a favorite from the search section for easy access later.')
               , CustomSettingContainer(title: 'How do I participate in an event on Eventak?', subTitle: 'To participate in an event on Eventak, simply find the event you are interested in and click on it to view more details. If the event allows for participation, you will typically find a registration or RSVP button that you can click to confirm your attendance, If the event has face ID security enabled, you will need to create a face ID persona for your account to participate. If face ID security is not enabled, you can participate in the event without needing face ID verification.'),
              CustomSettingContainer(title: 'Is Eventak available for download on all devices?', subTitle: 'Eventak is currently available for Android devices. We are working on making it available for iOS devices in the near future.')
              ,CustomSettingContainer(title: 'Can I save events for later viewing on Eventak?', subTitle: 'Yes, you can save events to your favorite section for later viewing. Simply tap on the event and select the "Add to Favorites" option. This will allow you to easily access the event at a later time.'),
              CustomSettingContainer(title: 'Is there a fee for using Eventak?', subTitle: 'Eventak is free to download and use for both event organizers and participants. However, some events may require payment for registration or ticket purchases, which will be clearly indicated on the event page.')
              ,CustomSettingContainer(title: 'How can I cancel an event that I have created on Eventak?', subTitle: 'To cancel an event that you have created on Eventak, navigate to my events page and simply click on cancel event button. Please note that this action is irreversible, and all event data will be permanently removed from the app after it cancelled.')
              ],
            ),
          ),
        ),
      ),
    );
  }
}
