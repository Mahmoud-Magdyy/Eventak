import 'package:eventak/features/create_event/presentation/screens/page_view_event.dart';
import 'package:eventak/features/home/data/model/all_event_model.dart';
import 'package:eventak/features/home/data/reposatiory/get_all_events_repo.dart';
import 'package:eventak/features/home/presenation/screens/home_screen.dart';
import 'package:eventak/features/my_events/presentation/screens/my_events.dart';
import 'package:eventak/features/profile/presentation/screens/profile_screen.dart';
import 'package:eventak/features/setting/presentation/screens/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.getAllEventsRepo,) : super(HomeInitial());
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

 
 //!
  // late List<AllEventModel>allEventModel;
  // int selectedIndex = -1;
  // void changeFavoriteIcon(int index) {
  //   selectedIndex = index;
  //   allEventModel[index].isSelectedFavoriteIcon = !allEventModel[index].isSelectedFavoriteIcon;
  //   // isSelectedFavoriteIcon= !isSelectedFavoriteIcon;
  //   emit(ChangeFavoriteIcon());
  //   print(index);
  // }
}
