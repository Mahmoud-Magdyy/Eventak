import 'package:eventak/core/utils/app_colors.dart';
import 'package:eventak/core/utils/app_images.dart';
import 'package:eventak/core/widgets/custom_text_field.dart';
import 'package:eventak/features/home/data/model/all_event_model.dart';
import 'package:eventak/features/home/presenation/home_cubit/home_cubit.dart';
import 'package:eventak/features/home/presenation/home_cubit/home_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Map<String, dynamic>> allUsers = [
    {
      "id": 1,
      "name": "Andy",
      "age": 26,
    },
    {
      "id": 2,
      "name": "Andy",
      "age": 26,
    },
    {
      "id": 3,
      "name": "mahmoud",
      "age": 26,
    },
    {
      "id": 4,
      "name": "ahmed",
      "age": 26,
    }
  ];
  // List<AllEventModel> allUsers = [];
  List<dynamic> foundUsers = [];
  @override
  void initState() {
    BlocProvider.of<HomeCubit>(context).getAllEvents();
    foundUsers = allUsers;
    super.initState();
  }

  void runrFilter(String enteredKeyword) {
    List<dynamic> result = [];

    if (enteredKeyword.isEmpty) {
      result = allUsers;
    } else {
      result = allUsers
          .where((user) => user['name']
              .toLowerCase()
              .contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      foundUsers = result;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
      ),
      body: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          // List<dynamic> allUsers = BlocProvider.of<HomeCubit>(context).events;
          // List<dynamic> foundUsers = [];
          // foundUsers = allUsers;
          // void runrFilter(String enteredKeyword) {
          //   List<dynamic> result = [];

          //   if (enteredKeyword.isEmpty) {
          //     result = allUsers;
          //   } else {
          //     result = allUsers
          //         .where((user) => user.nameOfEvent
          //             .toLowerCase()
          //             .contains(enteredKeyword.toLowerCase()))
          //         .toList();
          //   }
          //   setState(() {
          //     foundUsers = result;
          //   });
          // }

          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  TextField(onChanged: (value) {
                    runrFilter(value);
                  }),
                  // CustomTextFormField(controller: TextEditingController(),
                  // onChanged: (value) {
                  //   runrFilter(value);
                  // },),
                  Expanded(
                    child: ListView.builder(
                        itemCount: foundUsers.length,
                        itemBuilder: ((context, index) {
                          return ListTile(
                            key: ValueKey(foundUsers[index]),
                            leading: Container(
                              width: 88,
                              height: 88,
                              decoration: ShapeDecoration(
                                image: const DecorationImage(
                                  image: AssetImage(Assets.imagesImageee),
                                  fit: BoxFit.fill,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            title: Text(foundUsers[index]),
                            subtitle: Text(foundUsers[index]),
                          );

                          //  Row(
                          //   children: [
                          //     Container(
                          //       width: 88,
                          //       height: 88,
                          //       decoration: ShapeDecoration(
                          //         image:const DecorationImage(
                          //           image: AssetImage(Assets.imagesImageee),
                          //           fit: BoxFit.fill,
                          //         ),
                          //         shape: RoundedRectangleBorder(
                          //           borderRadius: BorderRadius.circular(10),
                          //         ),
                          //       ),
                          //     ),
                          //     SizedBox(width: 8,),
                          //     Column(
                          //       children: [

                          //       ],
                          //     )
                          //   ],
                          // );
                          // Card(
                          //   key: ValueKey(foundUsers[index]["id"]),
                          //   color: AppColors.primaryColor,
                          //   margin: const EdgeInsets.all(10),
                          //   child: ListTile(
                          //     leading: Text(foundUsers[index]["id"].toString()),
                          //     title: Text(foundUsers[index]["name"]),
                          //     subtitle: Text(foundUsers[index]["age"].toString()),
                          //   ),
                          // );
                        })),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
