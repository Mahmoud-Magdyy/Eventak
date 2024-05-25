import 'package:eventak/features/my_events/data/models/ai_model.dart';
import 'package:eventak/features/my_events/data/models/get_users_model.dart';
import 'package:eventak/features/my_events/data/models/my_event_model.dart';
import 'package:eventak/features/my_events/data/models/requested_model.dart';
import 'package:eventak/features/my_events/data/reposatiory/model_repo.dart';
import 'package:eventak/features/my_events/data/reposatiory/my_events_repo.dart';
import 'package:eventak/features/my_events/presentation/cubits/my_created_events_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class MyCreatedEventsCubit extends Cubit<MyCreatedEventsState> {
  MyCreatedEventsCubit(
      this.getMyCreatedEventsRepo, this.modelRegisterReposatiry)
      : super(MyCreatedEventsInitial());
  //! get My Created events
  List<MyCreatedEventModel> myCreatedEventList = [];
  final GetMyCreatedEventsReposatiry getMyCreatedEventsRepo;
  MyCreatedEventModel? myCreatedEventModel;
  void getMyCreatedEvents() async {
    emit(GetMyCreatedEventsLoadingState());
    final result = await getMyCreatedEventsRepo.getMyEvents();
    result.fold((l) => emit(GetMyCreatedEventsErrorState(message: l)), (r) {
      myCreatedEventList = r.data;
      // myCreatedEventModel=r.data[0];
      emit(GetMyCreatedEventsSuccessState(message: r.status));
    });
  }
  //! delete event

  void deleteEvent(String id) async {
    emit(DeleteEventLoadingState());
    final response = await getMyCreatedEventsRepo.deleteEvent(id);
    response.fold((l) => emit(DeleteEventErrorState(message: l)), (r) {
      myCreatedEventList.removeWhere((event) => event.id == id);
      emit(DeleteEventSuccessState(message: r.status));
    });
  }

  //! face id photo
  XFile? faceIdPhoto;
  void changeFaceIdPhoto(value) {
    faceIdPhoto = value;
    emit(ChangeFaceIdPhoto());
  }

//! model ai
  final ModelUserReposatiry modelRegisterReposatiry;
  // List<AddRegisterModel> registerModel = [];
  AiModel? aiModel;
  void model() async {
    emit(ModelAiLoadingState());
    final response = await modelRegisterReposatiry.model(img1: faceIdPhoto!);

    response.fold((l) => emit(ModelAiErrorState(l)), (r) {
      aiModel = r;
      emit(ModelAiSuccessState(r.message));
    });
  }

//! get Requested My events
  List<RequestedInMyEventsModel> requestedMyEventList = [];
  RequestedInMyEventsModel? requestedInMyEventsModel;
  void getRequestedMyEvents() async {
    emit(GetRequestedMyEventsLoadingState());
    final result = await getMyCreatedEventsRepo.getRequestedMyEvents();
    result.fold((l) => emit(GetRequestedMyEventsErrorState(message: l)), (r) {
      requestedMyEventList = r.events;
      emit(GetRequestedMyEventsSuccessState());
    });
  }

//!
//! get Users
  List<UserModel> usersEventList = [];
  UserModel? userModel;
  void getUsers(String nameofEvent) async {
    emit(GetUsersLoadingState());
    final result = await getMyCreatedEventsRepo.getUsers(nameofEvent);
    result.fold((l) => emit(GetUsersErrorState(message: l)), (r) {
      usersEventList = r.data;
      emit(GetUsersSuccessState());
    });
  }

  //! accept request
  void acceptRequest(String email, String nameOfEvent) async {
    emit(AcceptRequestLoadingState());
    final result =
        await getMyCreatedEventsRepo.acceptRequest(email, nameOfEvent);
    result.fold((l) => emit(AcceptRequestErrorState(message: l)), (r) {
      getMyCreatedEvents();
      emit(AcceptRequestSuccessState());
    });
  }
  // //! decline request
  void declineRequest(String email, String nameOfEvent) async {
    emit(DeclineRequestLoadingState());
    final result =
        await getMyCreatedEventsRepo.declineRequest(email, nameOfEvent);
    result.fold((l) => emit(DeclineRequestErrorState(message: l)), (r) {
      getMyCreatedEvents();
      emit(DeclineRequestSuccessState());
    });
  }
}
