
import 'package:eventak/features/my_events/data/models/my_event_model.dart';
import 'package:eventak/features/my_events/data/reposatiory/my_events_repo.dart';
import 'package:eventak/features/my_events/presentation/cubit/my_created_events_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyCreatedEventsCubit extends Cubit<MyCreatedEventsState> {
  MyCreatedEventsCubit(this.getMyCreatedEventsRepo) : super(MyCreatedEventsInitial());
  //! get My Created events
  List<MyCreatedEventModel> myCreatedEventList = [];
  final GetMyCreatedEventsReposatiry getMyCreatedEventsRepo;
  void getMyCreatedEvents() async {
    emit(GetMyCreatedEventsLoadingState());
    final result = await getMyCreatedEventsRepo.getMyEvents();
    result.fold((l) => emit(GetMyCreatedEventsErrorState(message:l)), (r) {
      myCreatedEventList = r.data;
      emit(GetMyCreatedEventsSuccessState(message: r.status));
    });
  
  }
  //! delete event

  void deleteEvent(String id)async{
    emit(DeleteEventLoadingState());
    final response = await  getMyCreatedEventsRepo.deleteEvent(id);
    response.fold((l) => emit(DeleteEventErrorState(message:l)), (r) {
      emit(DeleteEventSuccessState(message:r.status.toString()));
    });
  }

}
