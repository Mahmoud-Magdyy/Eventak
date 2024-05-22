// import 'package:eventak/features/create_event/presentation/screens/page_one_widgets/basic_details.dart';
// import 'package:eventak/features/create_event/presentation/screens/page_one_widgets/name_of_event.dart';
// import 'package:eventak/features/create_event/presentation/screens/page_one_widgets/price_of_the_ticket.dart';
// import 'package:eventak/features/my_events/presentation/edit_event_cubit/edit_event_cubit.dart';
// import 'package:eventak/features/my_events/presentation/edit_event_cubit/edit_event_state.dart';
// import 'package:eventak/features/my_events/presentation/widgets/edit_poster_event.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class EditEventScreen extends StatelessWidget {
//   const EditEventScreen({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Edit Event',
//         ),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         child: BlocConsumer<EditEventCubit, EditEventState>(
//           listener: (context, state) {},
//           builder: (context, state) {
//             return const Padding(
//               padding: EdgeInsets.all(16),
//               child: Column(
//                 children: [
//                   Column(
//                     children: [
//                       SizedBox(
//                         height: 26,
//                       ),
//                       BasicDetails(),
//                       SizedBox(
//                         height: 32,
//                       ),
//                       EditPosterOfEvent(),
//                       SizedBox(
//                         height: 26,
//                       ),
//                       NameOfEvent(),
//                       SizedBox(
//                         height: 26,
//                       ),
//                       // DateAndTime(createCubit: createCubit),
//                       SizedBox(
//                         height: 26,
//                       ),
//                       // CategoryDrowpDown(createCubit: createCubit),
//                       SizedBox(
//                         height: 26,
//                       ),
//                       PriceOfTheTicket(),
//                       SizedBox(
//                         height: 16,
//                       )
//                     ],
//                   ),
//                 ],
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
