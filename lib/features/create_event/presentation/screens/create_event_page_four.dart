// import 'package:eventak/features/create_event/presentation/cubit/create_event_cubit.dart';
// import 'package:eventak/features/create_event/presentation/cubit/create_event_state.dart';
// import 'package:eventak/features/create_event/presentation/screens/page_four_widgets/check_box.dart';
// import 'package:eventak/features/create_event/presentation/screens/page_four_widgets/orgnaizer.dart';
// import 'package:eventak/features/create_event/presentation/screens/page_four_widgets/profile_picture_container.dart';
// import 'package:eventak/features/create_event/presentation/screens/page_four_widgets/short_description.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// class CreateEventPageFour extends StatelessWidget {
//   const CreateEventPageFour({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<CreateEventCubit, CreateEventState>(
//       listener: (context, state) {},
//       builder: (context, state) {
//         final CreateEventCubit createCubit =
//             BlocProvider.of<CreateEventCubit>(context);
//         return const SingleChildScrollView(
//           child: Column(
//             children: [
//               SizedBox(
//                 height: 24,
//               ),
//               Organizer(),
//               SizedBox(
//                 height: 24,
//               ),
//               ProfilePicture(),
//               SizedBox(
//                 height: 24,
//               ),
//               ShortDescription(),
//               SizedBox(
//                 height: 16,
//               ),
//               // CheckBox(createCubit: createCubit)
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
