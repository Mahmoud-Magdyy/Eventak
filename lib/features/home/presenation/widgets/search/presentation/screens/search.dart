import 'package:eventak/features/home/data/model/all_event_model.dart';
import 'package:eventak/features/home/presenation/home_cubit/home_cubit.dart';
import 'package:eventak/features/home/presenation/home_cubit/home_state.dart';
import 'package:eventak/features/home/presenation/widgets/search/presentation/widgets/custom_list_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late List<AllEventModel> allEvents;
  late List<AllEventModel> filteredEvents;

  @override
  void initState() {
    super.initState();
    final homeCubit = BlocProvider.of<HomeCubit>(context);
    allEvents = homeCubit.events;
    filteredEvents = List.from(allEvents);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xfff4f4f4),
      appBar: AppBar(
        title: const Text('Search'),
      ),
      body: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, state) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  TextField(
                      decoration: const InputDecoration(
                          hintText: 'Search',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                            borderSide: BorderSide(color: Colors.white),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.all(Radius.circular(16)),
                          ),
                          fillColor: Colors.white,
                          filled: true),
                      onChanged: (value) {
                        setState(() {
                          filteredEvents = allEvents
                              .where((event) => event.nameOfEvent
                                  .toLowerCase()
                                  .contains(value.toLowerCase()))
                              .toList();
                        });
                      }),
                  const SizedBox(
                    height: 16,
                  ),
                  Expanded(
                    child: ListView.builder(
                        itemCount: filteredEvents.length,
                        itemBuilder: ((context, index) {
                          return ItemListSearch(
                            allEventModel: context.read<HomeCubit>().events[index],
                            key: ValueKey(filteredEvents[index].nameOfEvent),
                            filteredEvents: filteredEvents,
                            subtitle:
                                '${filteredEvents[index].date} | ${filteredEvents[index].startTime} - ${filteredEvents[index].endTime}',
                            title: filteredEvents[index].nameOfEvent,
                          );
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
