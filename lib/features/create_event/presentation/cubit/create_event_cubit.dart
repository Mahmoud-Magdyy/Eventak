import 'package:eventak/features/create_event/data/models/create_event_model.dart';
import 'package:eventak/features/create_event/data/reposatiry/event_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import 'create_event_state.dart';

class CreateEventCubit extends Cubit<CreateEventState> {
  CreateEventCubit(this.createEventRepo) : super(CreateEventInitial());
  XFile? image;
  XFile? profileImage;
  int page = 0;
  void changeImage(value) {
    image = value;
    emit(ChangeImageState());
  }

  void changeProfileImage(value) {
    profileImage = value;
    emit(ChangeImageState());
  }

  //!date
  DateTime currentDate = DateTime.now();
  DateTime selectedDate = DateTime.now();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  void getDate(context) async {
    emit(GetDateLoading());
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime(2100));

    if (pickedDate != null) {
      currentDate = pickedDate;
      emit(GetDateSuccess());
    } else {
      // print('pickedDate==null');
      emit(GetDateError());
    }
  }

  //!time
  String startTime = DateFormat('hh:mm a').format(DateTime.now());

  String endTime = DateFormat('hh:mm a')
      .format(DateTime.now().add(const Duration(minutes: 45)));
  void getStartDate(context) async {
    emit(GetStartDateLoading());
    TimeOfDay? pickedStartTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(DateTime.now()),
    );

    if (pickedStartTime != null) {
      startTime = pickedStartTime.format(context);
      // print(startTime);
      emit(GetStartDateSuccess());
    } else {
      // print('pickedStartTime==null');
      emit(GetStartDateError());
    }
  }

  void getEndDate(context) async {
    emit(GetEndDateLoading());
    TimeOfDay? pickedEndTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(DateTime.now()),
    );

    if (pickedEndTime != null) {
      endTime = pickedEndTime.format(context);
      // print(endTime);
      emit(GetEndDateSuccess());
    } else {
      // print(pickedEndTime);
      emit(GetEndDateError());
    }
  }

  //!category
  late String dropDownValue;
  List<DropdownMenuItem<dynamic>>? items = [
    const DropdownMenuItem(
      value: 'one',
      child: Text('one'),
    ),
    const DropdownMenuItem(
      value: 'two',
      child: Text('two'),
    ),
  ];
  //!check box
  bool? checkBoxValue = false;
  void onChangedCheckBoxValue(value) {
    checkBoxValue = value!;
    emit(ChangeCheckBoxSuccess());
  }
  //!variablues
  TextEditingController nameOfEvent = TextEditingController();

  //! create event method
  final CreateEventReposatiry createEventRepo;

  CreateEventModel? createEventModel;
  // register
  void createEvent() async {
    emit(CretaeEventLoadingState());
    final result = await createEventRepo.createEvent(
      nameOfEvent: nameOfEvent.text,
      description: description,
      startTime: startTime,
      endTime: endTime,
      date: date,
      category: category,
      priceInAdvance: priceInAdvance,
      priceAtTheDoor: priceAtTheDoor,
      whatIsIncludedInPrice: whatIsIncludedInPrice,
      orgShortDesc: orgShortDesc,
    );
    result.fold((l) => emit(CretaeEventErrorState(l)), (r) async {
      createEventModel = r;
      emit(CretaeEventSuccessgState());
    });
  }
}
