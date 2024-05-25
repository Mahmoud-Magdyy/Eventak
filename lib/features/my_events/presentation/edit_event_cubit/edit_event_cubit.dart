

import 'package:eventak/core/database/api/api/end_points.dart';
import 'package:eventak/core/functions/commns.dart';
import 'package:eventak/features/my_events/data/models/edit_model.dart';
import 'package:eventak/features/my_events/data/models/my_event_model.dart';
import 'package:eventak/features/my_events/data/reposatiory/edit_event_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import 'edit_event_state.dart';

class EditEventCubit extends Cubit<EditEventState> {
  EditEventCubit(this.editEventRepo) : super(EditEventInitial());

    XFile? editPosterImage;
  XFile? editProfileImage;
  int page = 0;

  void changeEditPosterImage(value) {
    editPosterImage = value;
    emit(ChangeEditPosterImageState());
  }

  void changeEditProfileImage(value) {
    editProfileImage = value;
    emit(ChangeEditProfileImageState());
  }

  //!date
  TextEditingController editDateController = TextEditingController();
  DateTime currentDate = DateTime.now();
  DateTime selectedDate = DateTime.now();
  GlobalKey<FormState> editFormKey = GlobalKey<FormState>();

  void getDate(context) async {
    emit(GetEditDateLoading());
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      editDateController.text = DateFormat('EEEE, MMMM d').format(pickedDate);
      emit(GetEditDateSuccess());
    } else {
      emit(GetEditDateError());
    }
  }

  //!time
  TextEditingController editStartTimeController = TextEditingController();
  TextEditingController editEndTimeController = TextEditingController();
  String startTime = DateFormat('hh:mm a').format(DateTime.now());
  String endTime = DateFormat('hh:mm a').format(DateTime.now().add(const Duration(minutes: 45)));

  void getStartDate(context) async {
    emit(GetEditStartDateLoading());
    TimeOfDay? pickedStartTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(DateTime.now()),
    );

    if (pickedStartTime != null) {
      editStartTimeController.text = pickedStartTime.format(context).toString();
      emit(GetEditStartDateSuccess());
    } else {
      emit(GetEditStartDateError());
    }
  }

  void getEndDate(context) async {
    emit(GetEditEndDateLoading());
    TimeOfDay? pickedEndTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.fromDateTime(DateTime.now()),
    );

    if (pickedEndTime != null) {
      editEndTimeController.text = pickedEndTime.format(context).toString();
      emit(GetEditEndDateSuccess());
    } else {
      emit(GetEditEndDateError());
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
    emit(ChangeEditCheckBoxSuccess());
  }

  //!variables
  TextEditingController editNameOfEventController = TextEditingController();
  TextEditingController editDateOfEventController = TextEditingController();
  TextEditingController editDescriptionOfEventController = TextEditingController();
  TextEditingController editPriceInAdvanceController = TextEditingController();
  TextEditingController editPriceAtTheDoorController = TextEditingController();
  TextEditingController editIncludedInPriceController = TextEditingController();
  TextEditingController editDistrictController = TextEditingController();
  TextEditingController editLocationController = TextEditingController();
  TextEditingController editOrgShortDescController = TextEditingController();
  TextEditingController editStreetController = TextEditingController();
  late String category;
  late String finalPrice = editPriceInAdvanceController.text + editPriceAtTheDoorController.text;

  bool isPosterImageSelected() {
    return editPosterImage != null;
  }

  //! edit event method
  EditEventModel? editEventModel;
  final EditEventRepo editEventRepo;
  MyCreatedEventModel? myCreatedEventModel;

  void initializeEventData(MyCreatedEventModel eventModel) {
    editNameOfEventController.text = eventModel.nameOfEvent;
    editDateController.text = eventModel.date;
    editDescriptionOfEventController.text = eventModel.description;
    editPriceInAdvanceController.text = eventModel.priceInAdvance;
    editPriceAtTheDoorController.text = eventModel.priceAtTheDoor;
    editIncludedInPriceController.text = eventModel.whatIsIncludedInPrice;
    editDistrictController.text = eventModel.location[Apikeys.district];
    editLocationController.text = eventModel.location[Apikeys.nameOfLocation];
    editOrgShortDescController.text = eventModel.orgShortDesc;
    editStreetController.text = eventModel.location[Apikeys.street];
    editStartTimeController.text = eventModel.startTime;
    editEndTimeController.text = eventModel.endTime;
    category = eventModel.category;
    editPosterImage = eventModel.posterPicture[0];
    emit(EditEventDataInitialized());
  }

  void editEvent(String id) async {
    emit(EditEventLoadingState());

    final data = <String, dynamic>{};

    if (editNameOfEventController.text.isNotEmpty) {
      data[Apikeys.nameOfEvent] = editNameOfEventController.text;
    }
    if (editPosterImage != null) {
      data[Apikeys.posterPicture] = await uploadImageToAPI(editPosterImage!);
    }
    if (editLocationController.text.isNotEmpty) {
      data[Apikeys.location[0]] = editLocationController.text;
      data[Apikeys.street] = editStreetController.text;
      data[Apikeys.district] = editDistrictController.text;
    }
    if (editDescriptionOfEventController.text.isNotEmpty) {
      data[Apikeys.description] = editDescriptionOfEventController.text;
    }
    if (editStartTimeController.text.isNotEmpty) {
      data[Apikeys.startTime] = editStartTimeController.text;
    }
    if (editEndTimeController.text.isNotEmpty) {
      data[Apikeys.endTime] = editEndTimeController.text;
    }
    if (editDateController.text.isNotEmpty) {
      data[Apikeys.date] = editDateController.text;
    }
    if (category.isNotEmpty) {
      data[Apikeys.category] = category;
    }
    if (editPriceInAdvanceController.text.isNotEmpty) {
      data[Apikeys.priceInAdvance] = editPriceInAdvanceController.text;
    }
    if (editPriceAtTheDoorController.text.isNotEmpty) {
      data[Apikeys.priceAtTheDoor] = editPriceAtTheDoorController.text;
    }
    if (editIncludedInPriceController.text.isNotEmpty) {
      data[Apikeys.whatIsIncludedInPrice] = editIncludedInPriceController.text;
    }
    if (editOrgShortDescController.text.isNotEmpty) {
      data[Apikeys.orgShortDesc] = editOrgShortDescController.text;
    }

    final result = await editEventRepo.editEvent(id: id, data: data);

    result.fold((l) => emit(EditEventErrorState(l)), (r) async {
      editEventModel = r;
      emit(EditEventSuccessState(r.status));
    });
  }

}
