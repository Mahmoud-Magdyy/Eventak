// import 'package:dio/dio.dart';
// import 'package:eventak/features/create_event/data/models/create_event_model.dart';
// import 'package:eventak/features/create_event/data/reposatiry/event_repo.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:intl/intl.dart';

// import 'edit_event_state.dart';

// class EditEventCubit extends Cubit<EditEventState> {
//   EditEventCubit(this.eventRepo, this.eventId) : super(EditEventInitial());

//   // final EventRepository eventRepo;
//   final String eventId;

//   XFile? editPosterImage;
//   XFile? editProfileImage;
//   int page = 0;

//   void changeEditPosterImage(value) {
//     editPosterImage = value;
//     emit(ChangeEditPosterImageState());
//   }

//   void changeEditProfileImage(value) {
//     editProfileImage = value;
//     emit(ChangeEditProfileImageState());
//   }

//   //!date
//   TextEditingController dateController = TextEditingController();
//   DateTime currentDate = DateTime.now();
//   DateTime selectedDate = DateTime.now();
//   GlobalKey<FormState> formKey = GlobalKey<FormState>();

//   void getDate(context) async {
//     emit(GetEditDateLoading());
//     DateTime? pickedDate = await showDatePicker(
//         context: context,
//         initialDate: DateTime.now(),
//         firstDate: DateTime(1900),
//         lastDate: DateTime(2100));

//     if (pickedDate != null) {
//       dateController.text = DateFormat('EEEE, MMMM d').format(pickedDate);
//       emit(GetEditDateSuccess());
//     } else {
//       emit(GetEditDateError());
//     }
//   }

//   //!time
//   TextEditingController startTimeController = TextEditingController();
//   TextEditingController endTimeController = TextEditingController();
//   String startTime = DateFormat('hh:mm a').format(DateTime.now());

//   String endTime = DateFormat('hh:mm a')
//       .format(DateTime.now().add(const Duration(minutes: 45)));

//   void getStartDate(context) async {
//     emit(GetEditStartDateLoading());
//     TimeOfDay? pickedStartTime = await showTimePicker(
//       context: context,
//       initialTime: TimeOfDay.fromDateTime(DateTime.now()),
//     );

//     if (pickedStartTime != null) {
//       startTimeController.text = pickedStartTime.format(context).toString();
//       emit(GetEditStartDateSuccess());
//     } else {
//       emit(GetEditStartDateError());
//     }
//   }

//   void getEndDate(context) async {
//     emit(GetEditEndDateLoading());
//     TimeOfDay? pickedEndTime = await showTimePicker(
//       context: context,
//       initialTime: TimeOfDay.fromDateTime(DateTime.now()),
//     );

//     if (pickedEndTime != null) {
//       endTimeController.text = pickedEndTime.format(context).toString();
//       emit(GetEditEndDateSuccess());
//     } else {
//       emit(GetEditEndDateError());
//     }
//   }

//   //!category
//   late String dropDownValue;
//   List<DropdownMenuItem<dynamic>>? items = [
//     const DropdownMenuItem(
//       value: 'Education',
//       child: Text('Education'),
//     ),
//     const DropdownMenuItem(
//       value: 'Music',
//       child: Text('Music'),
//     ),
//   ];

//   //!check box
//   bool? checkBoxValue = false;
//   void onChangedCheckBoxValue(value) {
//     checkBoxValue = value!;
//     emit(ChangeEditCheckBoxSuccess());
//   }

//   //!variables
//   TextEditingController nameOfEventController = TextEditingController();
//   TextEditingController dateOfEventController = TextEditingController();
//   TextEditingController descriptionOfEventController = TextEditingController();
//   TextEditingController priceInAdvanceController = TextEditingController();
//   TextEditingController priceAtTheDoorController = TextEditingController();
//   TextEditingController includedInPriceController = TextEditingController();
//   TextEditingController districtController = TextEditingController();
//   TextEditingController locationController = TextEditingController();
//   TextEditingController orgShortDescController = TextEditingController();
//   TextEditingController streetController = TextEditingController();
//   late String category;
//   late String finalPrice = priceInAdvanceController.text + priceAtTheDoorController.text;

//   bool isPosterImageSelected() {
//     return editPosterImage != null;
//   }

//   //! edit event method
//   CreateEventModel? createEventModel;

//   void editEvent() async {
//     emit(EditEventLoadingState());
//     final result = await eventRepo.editEvent(
//       eventId: eventId,
//       posterPicture: editPosterImage,
//       district: districtController.text,
//       nameOfLocation: locationController.text,
//       orgShortDesc: orgShortDescController.text,
//       street: streetController.text,
//       nameOfEvent: nameOfEventController.text,
//       description: descriptionOfEventController.text,
//       startTime: startTimeController.text,
//       endTime: endTimeController.text,
//       date: dateController.text,
//       category: category,
//       priceInAdvance: priceInAdvanceController.text,
//       priceAtTheDoor: priceAtTheDoorController.text,
//       whatIsIncludedInPrice: includedInPriceController.text,
//     );
//     result.fold((l) => emit(EditEventErrorState(l)), (r) async {
//       createEventModel = r;
//       emit(EditEventSuccessState(r.status));
//     });
//   }

//   late List<MultipartFile> multipartFiles;
//   void sendEditPhotosOfEvent(List<XFile> photosOfPlace) async {
//     emit(EditEventLoadingState());
//     final result = await eventRepo.sendEditPhotosOfEvent(
//       photosOfPlace: photosOfPlace,
//     );
//     result.fold((l) => emit(EditEventErrorState(l)), (r) async {
//       createEventModel = r;
//       emit(EditEventSuccessState(r.status));
//     });
//   }
// }
