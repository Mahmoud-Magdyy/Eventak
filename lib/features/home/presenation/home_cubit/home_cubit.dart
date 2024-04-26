

import 'package:eventak/features/create_event/presentation/screens/page_view_event.dart';
import 'package:eventak/features/home/presenation/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  List<Widget> screens=[const HomeScreen(),const HomeScreen(), PageViewEvent(),const HomeScreen(),const HomeScreen()];
  int currenIndex = 0;
  void changeIndex(index){
    currenIndex=index;
    emit(CurrenIndexState());
  }
}
