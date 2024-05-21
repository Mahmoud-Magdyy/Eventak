import 'package:dio/dio.dart';
import 'package:eventak/features/create_event/data/models/create_event_model.dart';
import 'package:eventak/features/create_event/data/reposatiry/event_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import 'create_event_state.dart';

class CreateEventCubit extends Cubit<CreateEventState> {
  CreateEventCubit(this.createEventRepo, this.category) : super(CreateEventInitial());
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
  TextEditingController dateController = TextEditingController();
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
      dateController.text = DateFormat('EEEE, MMMM d').format(pickedDate);
      emit(GetDateSuccess());
    } else {
      // print('pickedDate==null');
      emit(GetDateError());
    }
  }

  //!time
  TextEditingController statrTimeOfEventController = TextEditingController();
  TextEditingController endTimeOfEventController = TextEditingController();
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
      statrTimeOfEventController.text = pickedStartTime.format(context).toString();
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
      endTimeOfEventController.text = pickedEndTime.format(context).toString();
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
      value: 'Education',
      child: Text('Education'),
    ),
    const DropdownMenuItem(
      value: 'Music',
      child: Text('Music'),
    ),
  ];
  //!check box
  bool? checkBoxValue = false;
  void onChangedCheckBoxValue(value) {
    checkBoxValue = value!;
    emit(ChangeCheckBoxSuccess());
  }
  //!variablues
  TextEditingController nameOfEventController = TextEditingController();
  TextEditingController dateOfEventController = TextEditingController();
  TextEditingController descriptionOfEventController = TextEditingController();
  TextEditingController priceInAdvanceOfEventController = TextEditingController();
  TextEditingController priceAtTheDoorOfEventController = TextEditingController();
  TextEditingController whatIsIncludedInPriceController = TextEditingController();
  TextEditingController districtController = TextEditingController();
  TextEditingController nameOfLocationController = TextEditingController();
  TextEditingController orgShortDescController = TextEditingController();
  TextEditingController streetController = TextEditingController();
  late String category;
  late String finalPrice=priceInAdvanceOfEventController.text+priceAtTheDoorOfEventController.text;
  bool isPosterImageSelected() {
    return image != null;
  }
  //! create event method
  CreateEventReposatiry createEventRepo;

  CreateEventModel? createEventModel;
  // register
  void createEvent() async {
    emit(CretaeEventLoadingState());
    final result = await createEventRepo.createEvent(
      posterPicture: image!,
      district: districtController.text,
      nameOfLocation:nameOfLocationController.text ,
      orgShortDesc:orgShortDescController.text ,
      street: streetController.text,
      nameOfEvent: nameOfEventController.text,
      description: descriptionOfEventController.text,
      startTime: statrTimeOfEventController.text,
      endTime: endTimeOfEventController.text,
      date: dateController.text,
      category: category,
      priceInAdvance: priceInAdvanceOfEventController.text,
      priceAtTheDoor: priceAtTheDoorOfEventController.text,
      whatIsIncludedInPrice: whatIsIncludedInPriceController.text,

    );
    result.fold((l) => emit(CretaeEventErrorState(l)), (r) async {
      createEventModel = r;
      emit(CretaeEventSuccessState(r.status));
    });
  }
  late List<MultipartFile> multipartFiles;
  void sendPgosOfEvent(List<XFile> photosOfPlace) async {
    emit(CretaeEventLoadingState());
    final result = await createEventRepo.sendPhotosOfEvent(
      photosOfPlace:photosOfPlace ,
    );
    result.fold((l) => emit(CretaeEventErrorState(l)), (r) async {
      createEventModel = r;
      emit(CretaeEventSuccessState(r.status));
    });
  }
}
