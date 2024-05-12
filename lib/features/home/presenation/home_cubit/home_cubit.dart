import 'package:eventak/features/create_event/presentation/screens/page_view_event.dart';
import 'package:eventak/features/home/data/model/all_event_model.dart';
import 'package:eventak/features/home/data/model/trend_event_model.dart';
import 'package:eventak/features/home/data/reposatiory/add_to_favourit_repo.dart';
import 'package:eventak/features/home/data/reposatiory/get_all_events_repo.dart';
import 'package:eventak/features/home/data/reposatiory/get_trending_events.dart';
import 'package:eventak/features/home/presenation/screens/home_screen.dart';
import 'package:eventak/features/my_events/presentation/screens/my_events.dart';
import 'package:eventak/features/profile/presentation/screens/profile_screen.dart';
import 'package:eventak/features/setting/presentation/screens/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.getAllEventsRepo, this.addToFavouritRepo, this.getTrendigEventsRepo,) : super(HomeInitial());
String onTapCategoryName = '';
bool isSelected = false;
  List<Widget> screens = [
    const HomeScreen(),
    const MyEvents(),
    const PageViewEvent(),
    const SettingScreen(),
    const ProfileScreen()
  ];
  int currenIndex = 0;
  changeIndex(index) {
    currenIndex = index;
    emit(CurrenIndexState());
  }
  //! get all events
  List<AllEventModel> events = [];
  final GetAllEventsReposatiry getAllEventsRepo;
  void getAllEvents({String? categoryName}) async {
    emit(GetAllEventsLoadingState());
    final result = await getAllEventsRepo.getAllEvents(categoryName: categoryName);
    result.fold((l) => emit(GetAllEventsErrorState(l)), (r) {
      events = r.data;
      emit(GetAllEventsSuccessState(message: r.status));
    });
  
  }
  //! get trending events
  List<TrendingEeventModel> trendingEvents = [];
  final GetTrendigEventsReposatiry getTrendigEventsRepo;
  void getTrendigEvents() async {
    emit(GetTrendingEventsLoadingState());
    final result = await getTrendigEventsRepo.getTrendigEvents();
    result.fold((l) => emit(GetTrendingEventsErrorState(l)), (r) {
      trendingEvents = r.data;
      emit(GetTrendingEventsSuccessState(message: r.status));
    });
  
  }

 //! add to favourit method
  final AddToFavouritReposatiry addToFavouritRepo ;
  void addToFavourit(String id)async{
    emit(AddToFavouritLoadingState());
    final response = await  addToFavouritRepo.addToFavourit(id);
    response.fold((l) => emit(AddToFavouritErrorState(l)), (r) {
      emit(AddToFavouritSuccessState(r.message));
    });
  }
//! remove from favourit method
void removeFromFavourit(String id)async{
    emit(RemoveFromFavouritLoadingState());
    final response = await  addToFavouritRepo.removeFromFavourit(id);
    response.fold((l) => emit(RemoveFromFavouritErrorState(l)), (r) {
      emit(RemoveFromFavouritSuccessState(r.message));
    });
  }
  
}
