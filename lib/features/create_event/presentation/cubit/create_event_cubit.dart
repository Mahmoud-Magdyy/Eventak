import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import 'create_event_state.dart';

class CreateEventCubit extends Cubit<CreateEventState> {
  CreateEventCubit() : super(CreateEventInitial());
  XFile? image;
  void changeImage(value) {
    image = value;
    emit(ChangeImageState());
  }
}
