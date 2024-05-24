import 'package:eventak/features/create_event/data/models/create_event_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

import 'edit_event_state.dart';

class EditEventCubit extends Cubit<EditEventState> {
  EditEventCubit() : super(EditEventInitial());

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
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void getDate(context) async {
    emit(GetEditDateLoading());
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100)
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
  CreateEventModel? createEventModel;

  // void editEvent() async {
  //   emit(EditEventLoadingState());
  //   final result = await eventRepo.editEvent(
  //     eventId: eventId,
  //     posterPicture: editPosterImage,
  //     district: editDistrictController.text,
  //     nameOfLocation: editLocationController.text,
  //     orgShortDesc: editOrgShortDescController.text,
  //     street: editStreetController.text,
  //     nameOfEvent: editNameOfEventController.text,
  //     description: editDescriptionOfEventController.text,
  //     startTime: editStartTimeController.text,
  //     endTime: editEndTimeController.text,
  //     date: editDateController.text,
  //     category: category,
  //     priceInAdvance: editPriceInAdvanceController.text,
  //     priceAtTheDoor: editPriceAtTheDoorController.text,
  //     whatIsIncludedInPrice: editIncludedInPriceController.text,
  //   );
  //   result.fold((l) => emit(EditEventErrorState(l)), (r) async {
  //     createEventModel = r;
  //     emit(EditEventSuccessState(r.status));
  //   });
  // }

  // late List<MultipartFile> multipartFiles;
  // void sendEditPhotosOfEvent(List<XFile> photosOfPlace) async {
  //   emit(EditEventLoadingState());
  //   final result = await eventRepo.sendEditPhotosOfEvent(
  //     photosOfPlace: photosOfPlace,
  //   );
  //   result.fold((l) => emit(EditEventErrorState(l)), (r) async {
  //     createEventModel = r;
  //     emit(EditEventSuccessState(r.status));
  //   });
  // }
}
